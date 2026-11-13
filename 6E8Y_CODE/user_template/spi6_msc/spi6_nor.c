/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * GD25B512ME (64 MByte) on the SPI6 pins of hpm6e8ydemo.
 *
 * The four wired signals are driven as a small software SPI master:
 *   PB20 SCLK, PB21 /CS, PB22 MISO, PB23 MOSI
 *
 * A hardware-SPI variant was tried first, but this board wiring only
 * returned 0x00/0xFF through the SPI6 peripheral while the same pins
 * worked in GPIO mode.  Software SPI keeps the driver self-contained and
 * makes the four-wire setup usable without a scope.
 */

#include "spi6_nor.h"

#include <string.h>

#include "hpm_gpio_drv.h"
#include "hpm_gpiom_drv.h"

#define GD25_CAPACITY_BYTES  (64u * 1024u * 1024u)
#define GD25_SECTOR_SIZE     (4096u)
#define GD25_PAGE_SIZE       (256u)

#define GD25_CMD_WRITE_EN   0x06u
#define GD25_CMD_READ_STATUS 0x05u
#define GD25_CMD_READ_4B    0x13u
#define GD25_CMD_PROGRAM_4B 0x12u
#define GD25_CMD_ERASE_4B   0x21u
#define GD25_CMD_JEDEC      0x9Fu

static uint8_t s_ready;

static void bb_delay(void)
{
    for (volatile uint32_t i = 0; i < 20u; i++) {
        __asm__ volatile("nop");
    }
}

static void bb_cs(uint8_t state)
{
    gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 21, state);
    bb_delay();
}

static uint8_t bb_xfer(uint8_t out)
{
    uint8_t in = 0;

    for (int bit = 7; bit >= 0; bit--) {
        gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 23, (out >> bit) & 1u);
        bb_delay();

        gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 20, 1);
        bb_delay();
        in = (uint8_t)((in << 1) | (gpio_read_pin(HPM_GPIO0, GPIO_DI_GPIOB, 22) & 1u));

        gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 20, 0);
        bb_delay();
    }

    return in;
}

static void bb_pins_init(void)
{
    HPM_IOC->PAD[IOC_PAD_PB20].FUNC_CTL = IOC_PB20_FUNC_CTL_GPIO_B_20;
    HPM_IOC->PAD[IOC_PAD_PB21].FUNC_CTL = IOC_PB21_FUNC_CTL_GPIO_B_21;
    HPM_IOC->PAD[IOC_PAD_PB22].FUNC_CTL = IOC_PB22_FUNC_CTL_GPIO_B_22;
    HPM_IOC->PAD[IOC_PAD_PB23].FUNC_CTL = IOC_PB23_FUNC_CTL_GPIO_B_23;

    HPM_IOC->PAD[IOC_PAD_PB20].PAD_CTL = IOC_PAD_PAD_CTL_DS_SET(7) |
                                          IOC_PAD_PAD_CTL_SR_SET(1) |
                                          IOC_PAD_PAD_CTL_SPD_SET(3);
    HPM_IOC->PAD[IOC_PAD_PB21].PAD_CTL = IOC_PAD_PAD_CTL_PE_SET(1) |
                                          IOC_PAD_PAD_CTL_DS_SET(7) |
                                          IOC_PAD_PAD_CTL_SR_SET(1) |
                                          IOC_PAD_PAD_CTL_SPD_SET(3);
    HPM_IOC->PAD[IOC_PAD_PB22].PAD_CTL = IOC_PAD_PAD_CTL_PE_SET(1) |
                                          IOC_PAD_PAD_CTL_DS_SET(7) |
                                          IOC_PAD_PAD_CTL_SR_SET(1) |
                                          IOC_PAD_PAD_CTL_SPD_SET(3);
    HPM_IOC->PAD[IOC_PAD_PB23].PAD_CTL = IOC_PAD_PAD_CTL_DS_SET(7) |
                                          IOC_PAD_PAD_CTL_SR_SET(1) |
                                          IOC_PAD_PAD_CTL_SPD_SET(3);

    gpiom_set_pin_controller(HPM_GPIOM, GPIOM_ASSIGN_GPIOB, 20, gpiom_soc_gpio0);
    gpiom_set_pin_controller(HPM_GPIOM, GPIOM_ASSIGN_GPIOB, 21, gpiom_soc_gpio0);
    gpiom_set_pin_controller(HPM_GPIOM, GPIOM_ASSIGN_GPIOB, 22, gpiom_soc_gpio0);
    gpiom_set_pin_controller(HPM_GPIOM, GPIOM_ASSIGN_GPIOB, 23, gpiom_soc_gpio0);

    gpio_set_pin_output(HPM_GPIO0, GPIO_OE_GPIOB, 20);
    gpio_set_pin_output(HPM_GPIO0, GPIO_OE_GPIOB, 21);
    gpio_set_pin_input(HPM_GPIO0, GPIO_OE_GPIOB, 22);
    gpio_set_pin_output(HPM_GPIO0, GPIO_OE_GPIOB, 23);

    gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 20, 0);
    gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 21, 1);
    gpio_write_pin(HPM_GPIO0, GPIO_DO_GPIOB, 23, 0);
    bb_delay();
}

static uint8_t gd25_read_status(void)
{
    uint8_t status;

    bb_cs(0);
    (void)bb_xfer(GD25_CMD_READ_STATUS);
    status = bb_xfer(0xFFu);
    bb_cs(1);

    return status;
}

static int gd25_wait_ready(void)
{
    for (uint32_t i = 0; i < 20000000u; i++) {
        if ((gd25_read_status() & 0x01u) == 0u) {
            return 0;
        }
    }
    return -1;
}

static void gd25_write_enable(void)
{
    bb_cs(0);
    (void)bb_xfer(GD25_CMD_WRITE_EN);
    bb_cs(1);
}

static void gd25_send_addr(uint32_t address)
{
    (void)bb_xfer((uint8_t)(address >> 24));
    (void)bb_xfer((uint8_t)(address >> 16));
    (void)bb_xfer((uint8_t)(address >> 8));
    (void)bb_xfer((uint8_t)address);
}

int spi6_nor_init(void)
{
    uint8_t id[3];

    bb_pins_init();
    (void)spi6_nor_read_jedec(id);

    /* GigaDevice JEDEC manufacturer ID. */
    if (id[0] != 0xC8u) {
        return -1;
    }

    s_ready = 1;
    return 0;
}

int spi6_nor_is_ready(void)
{
    return s_ready != 0u;
}

int spi6_nor_read_jedec(uint8_t id[3])
{
    bb_pins_init();
    bb_cs(0);
    (void)bb_xfer(GD25_CMD_JEDEC);
    for (uint32_t i = 0; i < 3u; i++) {
        id[i] = bb_xfer(0xFFu);
    }
    bb_cs(1);
    return 0;
}

uint32_t spi6_nor_capacity_bytes(void)
{
    return GD25_CAPACITY_BYTES;
}

uint32_t spi6_nor_sector_size(void)
{
    return GD25_SECTOR_SIZE;
}

uint32_t spi6_nor_page_size(void)
{
    return GD25_PAGE_SIZE;
}

int spi6_nor_read(uint32_t address, uint8_t *buffer, uint32_t length)
{
    if ((address + length) > GD25_CAPACITY_BYTES) {
        return -1;
    }

    bb_cs(0);
    (void)bb_xfer(GD25_CMD_READ_4B);
    gd25_send_addr(address);
    for (uint32_t i = 0; i < length; i++) {
        buffer[i] = bb_xfer(0xFFu);
    }
    bb_cs(1);

    return 0;
}

int spi6_nor_program(uint32_t address, const uint8_t *buffer, uint32_t length)
{
    if ((address + length) > GD25_CAPACITY_BYTES) {
        return -1;
    }

    while (length > 0u) {
        uint32_t page_left = GD25_PAGE_SIZE - (address % GD25_PAGE_SIZE);
        uint32_t chunk = (length > page_left) ? page_left : length;

        gd25_write_enable();

        bb_cs(0);
        (void)bb_xfer(GD25_CMD_PROGRAM_4B);
        gd25_send_addr(address);
        for (uint32_t i = 0; i < chunk; i++) {
            (void)bb_xfer(buffer[i]);
        }
        bb_cs(1);

        if (gd25_wait_ready() != 0) {
            return -1;
        }

        address += chunk;
        buffer += chunk;
        length -= chunk;
    }

    return 0;
}

int spi6_nor_erase(uint32_t address, uint32_t length)
{
    if ((address % GD25_SECTOR_SIZE) != 0u ||
        (length % GD25_SECTOR_SIZE) != 0u ||
        (address + length) > GD25_CAPACITY_BYTES) {
        return -1;
    }

    while (length > 0u) {
        gd25_write_enable();

        bb_cs(0);
        (void)bb_xfer(GD25_CMD_ERASE_4B);
        gd25_send_addr(address);
        bb_cs(1);

        if (gd25_wait_ready() != 0) {
            return -1;
        }

        address += GD25_SECTOR_SIZE;
        length -= GD25_SECTOR_SIZE;
    }

    return 0;
}
