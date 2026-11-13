/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include <stdio.h>
#include "board.h"

int main(void)
{
    board_init_core1();

    printf("Hello world from %s core1!\n", BOARD_NAME);

    while (1) {
        board_delay_ms(1000);
    }
    return 0;
}
