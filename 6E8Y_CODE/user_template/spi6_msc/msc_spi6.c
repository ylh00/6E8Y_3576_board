/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * CherryUSB MSC device backed by the SPI6 GD25B512ME NOR flash.
 *
 * A 4 KiB erase-sector write-back cache is used because NOR flash cannot
 * overwrite a programmed byte: a 512-byte MSC write becomes a
 * read-modify-erase-program of the containing 4 KiB sector.  The cache is
 * flushed when the host moves to a different 4 KiB sector.
 */

#include "msc_spi6.h"

#include <string.h>

#include "board.h"
#include "hpm_l1c_drv.h"
#include "spi6_nor.h"
#include "usb_config.h"
#include "usbd_core.h"
#include "usbd_msc.h"

#define MSC_IN_EP   0x81
#define MSC_OUT_EP  0x02

#define MSC_USBD_VID       0x34B7
#define MSC_USBD_PID       0xEAF2
#define MSC_USBD_MAX_POWER 200

#define MSC_BLOCK_SIZE     512u
#define MSC_CACHE_SIZE     4096u

#define USB_CONFIG_SIZE (9 + MSC_DESCRIPTOR_LEN)

static const uint8_t device_descriptor[] = {
    USB_DEVICE_DESCRIPTOR_INIT(USB_2_0, 0x00, 0x00, 0x00,
                               MSC_USBD_VID, MSC_USBD_PID, 0x0100, 0x01),
};

static const uint8_t config_descriptor_hs[] = {
    USB_CONFIG_DESCRIPTOR_INIT(USB_CONFIG_SIZE, 0x01, 0x01,
                               USB_CONFIG_BUS_POWERED, MSC_USBD_MAX_POWER),
    MSC_DESCRIPTOR_INIT(0x00, MSC_OUT_EP, MSC_IN_EP, USB_BULK_EP_MPS_HS, 0x02),
};

static const uint8_t config_descriptor_fs[] = {
    USB_CONFIG_DESCRIPTOR_INIT(USB_CONFIG_SIZE, 0x01, 0x01,
                               USB_CONFIG_BUS_POWERED, MSC_USBD_MAX_POWER),
    MSC_DESCRIPTOR_INIT(0x00, MSC_OUT_EP, MSC_IN_EP, USB_BULK_EP_MPS_FS, 0x02),
};

static const uint8_t device_quality_descriptor[] = {
    USB_DEVICE_QUALIFIER_DESCRIPTOR_INIT(USB_2_0, 0x00, 0x00, 0x00, 0x01),
};

static const uint8_t other_speed_config_descriptor_hs[] = {
    USB_OTHER_SPEED_CONFIG_DESCRIPTOR_INIT(USB_CONFIG_SIZE, 0x01, 0x01,
                                           USB_CONFIG_BUS_POWERED, MSC_USBD_MAX_POWER),
    MSC_DESCRIPTOR_INIT(0x00, MSC_OUT_EP, MSC_IN_EP, USB_BULK_EP_MPS_FS, 0x02),
};

static const uint8_t other_speed_config_descriptor_fs[] = {
    USB_OTHER_SPEED_CONFIG_DESCRIPTOR_INIT(USB_CONFIG_SIZE, 0x01, 0x01,
                                           USB_CONFIG_BUS_POWERED, MSC_USBD_MAX_POWER),
    MSC_DESCRIPTOR_INIT(0x00, MSC_OUT_EP, MSC_IN_EP, USB_BULK_EP_MPS_HS, 0x02),
};

static const char *string_descriptors[] = {
    (const char[]){ 0x09, 0x04 },
    "HPMicro",
    "HPM SPI6 GD25 MSC",
    "SPI6-GD25-0001",
};

static const uint8_t *device_descriptor_callback(uint8_t speed)
{
    (void)speed;
    return device_descriptor;
}

static const uint8_t *config_descriptor_callback(uint8_t speed)
{
    if (speed == USB_SPEED_HIGH) {
        return config_descriptor_hs;
    }
    if (speed == USB_SPEED_FULL) {
        return config_descriptor_fs;
    }
    return NULL;
}

static const uint8_t *device_quality_descriptor_callback(uint8_t speed)
{
    (void)speed;
    return device_quality_descriptor;
}

static const uint8_t *other_speed_config_descriptor_callback(uint8_t speed)
{
    if (speed == USB_SPEED_HIGH) {
        return other_speed_config_descriptor_hs;
    }
    if (speed == USB_SPEED_FULL) {
        return other_speed_config_descriptor_fs;
    }
    return NULL;
}

static const char *string_descriptor_callback(uint8_t speed, uint8_t index)
{
    (void)speed;
    if (index >= (sizeof(string_descriptors) / sizeof(string_descriptors[0]))) {
        return NULL;
    }
    return string_descriptors[index];
}

static const struct usb_descriptor msc_spi6_descriptor = {
    .device_descriptor_callback = device_descriptor_callback,
    .config_descriptor_callback = config_descriptor_callback,
    .device_quality_descriptor_callback = device_quality_descriptor_callback,
    .other_speed_descriptor_callback = other_speed_config_descriptor_callback,
    .string_descriptor_callback = string_descriptor_callback,
};

static struct usbd_interface s_msc_intf;

ATTR_PLACE_AT_WITH_ALIGNMENT(".ahb_sram", HPM_L1C_CACHELINE_SIZE)
static uint8_t s_cache[MSC_CACHE_SIZE];

static uint32_t s_cache_addr;
static uint32_t s_erase_size;
static uint32_t s_block_count;
static uint8_t s_cache_valid;
static uint8_t s_cache_dirty;
static uint8_t s_ready;

static void msc_spi6_event(uint8_t busid, uint8_t event)
{
    (void)busid;
    (void)event;
}

static int msc_cache_flush(void)
{
    if (!s_cache_dirty) {
        return 0;
    }

    if (spi6_nor_erase(s_cache_addr, s_erase_size) != 0) {
        return -1;
    }
    if (spi6_nor_program(s_cache_addr, s_cache, s_erase_size) != 0) {
        return -1;
    }

    s_cache_dirty = 0;
    return 0;
}

static int msc_cache_load(uint32_t addr)
{
    if (s_cache_valid && (s_cache_addr == addr)) {
        return 0;
    }

    if (msc_cache_flush() != 0) {
        return -1;
    }
    if (spi6_nor_read(addr, s_cache, s_erase_size) != 0) {
        return -1;
    }

    s_cache_addr = addr;
    s_cache_valid = 1;
    s_cache_dirty = 0;
    return 0;
}

int msc_spi6_flush(void)
{
    return msc_cache_flush();
}

void usbd_msc_get_cap(uint8_t busid, uint8_t lun, uint32_t *block_num, uint32_t *block_size)
{
    (void)busid;
    (void)lun;

    *block_num = s_block_count;
    *block_size = MSC_BLOCK_SIZE;
}

int usbd_msc_sector_read(uint8_t busid, uint8_t lun, uint32_t sector,
                         uint8_t *buffer, uint32_t length)
{
    (void)busid;
    (void)lun;

    if (!s_ready || sector >= s_block_count || length == 0u) {
        return -1;
    }

    uint32_t addr = sector * MSC_BLOCK_SIZE;

    if (s_cache_valid &&
        addr >= s_cache_addr &&
        (addr + length) <= (s_cache_addr + s_erase_size)) {
        memcpy(buffer, &s_cache[addr - s_cache_addr], length);
        return 0;
    }

    if (msc_cache_flush() != 0) {
        return -1;
    }
    return spi6_nor_read(addr, buffer, length);
}

int usbd_msc_sector_write(uint8_t busid, uint8_t lun, uint32_t sector,
                          uint8_t *buffer, uint32_t length)
{
    (void)busid;
    (void)lun;

    if (!s_ready || sector >= s_block_count || length == 0u) {
        return -1;
    }

    uint32_t addr = sector * MSC_BLOCK_SIZE;

    while (length > 0u) {
        uint32_t erase_addr = addr & ~(s_erase_size - 1u);
        uint32_t offset = addr - erase_addr;
        uint32_t chunk = s_erase_size - offset;

        if (chunk > length) {
            chunk = length;
        }

        if (msc_cache_load(erase_addr) != 0) {
            return -1;
        }

        memcpy(&s_cache[offset], buffer, chunk);
        s_cache_dirty = 1;

        addr += chunk;
        buffer += chunk;
        length -= chunk;
    }

    return 0;
}

int msc_spi6_init(uint8_t busid, uint32_t reg_base)
{
    if (!spi6_nor_is_ready()) {
        return -1;
    }

    s_erase_size = spi6_nor_sector_size();
    if (s_erase_size == 0u || s_erase_size > MSC_CACHE_SIZE) {
        return -2;
    }

    s_block_count = spi6_nor_capacity_bytes() / MSC_BLOCK_SIZE;
    if (s_block_count == 0u) {
        return -3;
    }

    s_cache_valid = 0;
    s_cache_dirty = 0;
    s_ready = 1;

    usbd_desc_register(busid, &msc_spi6_descriptor);
    usbd_add_interface(busid, usbd_msc_init_intf(busid, &s_msc_intf, MSC_OUT_EP, MSC_IN_EP));
    usbd_initialize(busid, reg_base, msc_spi6_event);

    return 0;
}
