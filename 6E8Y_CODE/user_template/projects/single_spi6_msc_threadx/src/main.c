/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * ThreadX single-core SPI6 GD25 flash as a CherryUSB MSC U-disk.
 */

#include <stdio.h>

#include "board.h"
#include "msc_spi6.h"
#include "spi6_nor.h"
#include "tx_api.h"
#include "usb_config.h"
#include "usb_osal.h"

#define USB_OSAL_MEM_SIZE   (48u * 1024u)
#define APP_STACK_SIZE      (4096u)

static uint8_t s_usb_osal_mem[USB_OSAL_MEM_SIZE] __attribute__((aligned(8)));
static uint8_t s_app_stack[APP_STACK_SIZE] __attribute__((aligned(8)));
static TX_THREAD s_app_thread;

TX_BYTE_POOL usb_byte_pool;

static void app_thread_entry(ULONG arg)
{
    (void)arg;

    printf("\r\nSPI6 GD25 MSC U-disk (ThreadX, core0)\r\n");

    if (spi6_nor_init() != 0) {
        printf("SPI6 GD25 init failed\r\n");
        while (1) {
            tx_thread_sleep(100);
        }
    }

    printf("GD25 capacity: %lu MB, sector: %lu B\r\n",
           (unsigned long)(spi6_nor_capacity_bytes() / (1024u * 1024u)),
           (unsigned long)spi6_nor_sector_size());

    if (msc_spi6_init(0, CONFIG_HPM_USBD_BASE) != 0) {
        printf("MSC init failed\r\n");
    } else {
        printf("USB MSC ready (ThreadX), VID:PID 34B7:EAF2\r\n");
    }

    while (1) {
        tx_thread_sleep(100);
    }
}

void tx_application_define(void *first_unused_memory)
{
    (void)first_unused_memory;

    usb_osal_init(s_usb_osal_mem, sizeof(s_usb_osal_mem));

    tx_thread_create(&s_app_thread, "spi6_msc", app_thread_entry, 0,
                     s_app_stack, sizeof(s_app_stack),
                     5, 5, TX_NO_TIME_SLICE, TX_AUTO_START);
}

int main(void)
{
    board_init();
    intc_set_irq_priority(CONFIG_HPM_USBD_IRQn, 2);

    tx_kernel_enter();
    return 0;
}
