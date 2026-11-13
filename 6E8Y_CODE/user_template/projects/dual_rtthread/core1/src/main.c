/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include "board.h"
#include "rtt_port.h"
#include <rtthread.h>

/*
 * RT-Thread's rtt_port.c calls init_uart_pins(). The hpm6e8ydemo board only
 * provides init_pins(), and core0 has already configured the shared console
 * pins before releasing core1, so a weak no-op fallback is enough here.
 * Boards that provide a real init_uart_pins() override this weak symbol.
 */
__attribute__((weak)) void init_uart_pins(UART_Type *ptr)
{
    (void)ptr;
}

void rt_hw_board_init(void)
{
    board_init_core1();
    rtt_base_init();
}

int main(void)
{
    rt_kprintf("Hello world from %s core1 (RT-Thread)!\n", BOARD_NAME);

    while (1) {
        rt_thread_mdelay(1000);
    }
    return 0;
}
