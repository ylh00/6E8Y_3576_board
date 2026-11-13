/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include <stdio.h>
#include "board.h"
#include "multicore_common.h"

int main(void)
{
    int u;

    board_init();
    multicore_release_cpu(HPM_CORE1, SEC_CORE_IMG_START);

    printf("Hello world from %s core0!\n", BOARD_NAME);

    while (1) {
        u = getchar();
        if (u == '\r') {
            u = '\n';
        }
        printf("%c", u);
    }
    return 0;
}
