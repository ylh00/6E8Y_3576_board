/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include <stdio.h>
#include "board.h"
#include "tx_api.h"

#define CORE1_THREAD_STACK_SIZE 1024

static TX_THREAD core1_thread;
static UCHAR core1_thread_stack[CORE1_THREAD_STACK_SIZE];

static void core1_thread_entry(ULONG thread_input)
{
    (void)thread_input;

    while (1) {
        tx_thread_sleep(TX_TIMER_TICKS_PER_SECOND);
    }
}

void tx_application_define(void *first_unused_memory)
{
    (void)first_unused_memory;

    tx_thread_create(&core1_thread, "core1", core1_thread_entry, 0,
                     core1_thread_stack, CORE1_THREAD_STACK_SIZE,
                     1, 1, TX_NO_TIME_SLICE, TX_AUTO_START);
}

int main(void)
{
    board_init_core1();
    printf("Hello world from %s core1 (ThreadX)!\n", BOARD_NAME);

    tx_kernel_enter();
    return 0;
}
