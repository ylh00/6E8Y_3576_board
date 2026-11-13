/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * RT-Thread Nano single-core SPI6 GD25 flash as a CherryUSB MSC U-disk.
 */

#include <stdio.h>

#include "board.h"
#include "msc_spi6.h"
#include "rtthread.h"
#include "spi6_nor.h"
#include "usb_config.h"

/*
 * rtt_port.c calls init_uart_pins(); hpm6e8ydemo configures all pins in
 * board_init() already, so a weak no-op is sufficient.
 */
__attribute__((weak)) void init_uart_pins(UART_Type *ptr)
{
    (void)ptr;
}

int main(void)
{
    printf("\r\nSPI6 GD25 MSC U-disk (RT-Thread, core0)\r\n");

    if (spi6_nor_init() != 0) {
        printf("SPI6 GD25 init failed\r\n");
        while (1) {
            rt_thread_mdelay(1000);
        }
    }

    printf("GD25 capacity: %lu MB, sector: %lu B\r\n",
           (unsigned long)(spi6_nor_capacity_bytes() / (1024u * 1024u)),
           (unsigned long)spi6_nor_sector_size());

    if (msc_spi6_init(0, CONFIG_HPM_USBD_BASE) != 0) {
        printf("MSC init failed\r\n");
    } else {
        printf("USB MSC ready (RT-Thread), VID:PID 34B7:EAF2\r\n");
    }

    while (1) {
        rt_thread_mdelay(1000);
    }
}
