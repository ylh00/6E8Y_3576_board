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
    int u;

    board_init();

    printf("Hello world from %s!\n", BOARD_NAME);

    while (1) {
        u = getchar();
        if (u == '\r') {
            u = '\n';
        }
        printf("%c", u);
    }
    return 0;
}
