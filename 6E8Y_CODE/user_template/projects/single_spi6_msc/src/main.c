/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Bare-metal single-core SPI6 GD25 flash as a CherryUSB MSC U-disk.
 */

#include <stdio.h>

#include "board.h"
#include "hpm_mchtmr_drv.h"
#include "msc_spi6.h"
#include "spi6_nor.h"
#include "usb_config.h"
#include "usbd_core.h"
#include "usbd_msc.h"

#define FLUSH_PERIOD_TICKS (24000000u)  /* 1 second at 24 MHz */

volatile uint8_t g_jedec_id[3];

int main(void)
{
    uint64_t last_flush;

    board_init();
    intc_set_irq_priority(CONFIG_HPM_USBD_IRQn, 2);

    printf("\r\nSPI6 GD25 MSC U-disk (bare-metal, core0)\r\n");

    if (spi6_nor_init() != 0) {
        uint8_t id[3] = { 0 };
        (void)spi6_nor_read_jedec(id);
        g_jedec_id[0] = id[0];
        g_jedec_id[1] = id[1];
        g_jedec_id[2] = id[2];
        printf("SPI6 GD25 init failed, JEDEC: %02X %02X %02X\r\n", id[0], id[1], id[2]);
        while (1) {
        }
    }

    printf("GD25 capacity: %lu MB, sector: %lu B, page: %lu B\r\n",
           (unsigned long)(spi6_nor_capacity_bytes() / (1024u * 1024u)),
           (unsigned long)spi6_nor_sector_size(),
           (unsigned long)spi6_nor_page_size());

    if (msc_spi6_init(0, CONFIG_HPM_USBD_BASE) != 0) {
        printf("MSC init failed\r\n");
        while (1) {
        }
    }

    printf("USB MSC ready, VID:PID 34B7:EAF2\r\n");

    last_flush = mchtmr_get_count(HPM_MCHTMR);

    while (1) {
        usbd_msc_polling(0);

        uint64_t now = mchtmr_get_count(HPM_MCHTMR);
        if ((now - last_flush) >= FLUSH_PERIOD_TICKS) {
            (void)msc_spi6_flush();
            last_flush = now;
        }
    }
}
