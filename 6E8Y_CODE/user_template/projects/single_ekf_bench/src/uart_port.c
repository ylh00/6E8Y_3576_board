/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * UART3 transport at 2 Mbaud (hpm6e8ydemo console UART).
 * Enable with -DUSE_UART3=ON.
 */

#include "usb_config.h"

#if USE_UART3

#include <string.h>

#include "board.h"
#include "hpm_uart_drv.h"
#include "transport.h"

static uint8_t s_uart_buf[sizeof(proto_request_t)];
static uint32_t s_uart_idx;

int transport_init(void)
{
    s_uart_idx = 0;
    return 0;
}

int transport_read(proto_request_t *req)
{
    while (1) {
        uint8_t c;

        if (uart_receive_byte(BOARD_CONSOLE_UART_BASE, &c) != status_success) {
            continue;
        }

        if (s_uart_idx < 4) {
            s_uart_buf[s_uart_idx++] = c;

            if (s_uart_idx == 4) {
                uint32_t magic;
                memcpy(&magic, s_uart_buf, sizeof(magic));
                if (magic != PROTO_MAGIC) {
                    s_uart_idx = 0;
                }
            }
        } else {
            s_uart_buf[s_uart_idx++] = c;

            if (s_uart_idx == sizeof(s_uart_buf)) {
                s_uart_idx = 0;
                memcpy(req, s_uart_buf, sizeof(*req));

                if (req->magic == PROTO_MAGIC && req->version == PROTO_VERSION) {
                    return 1;
                }
            }
        }
    }
}

int transport_write(const proto_response_t *rsp)
{
    const uint8_t *p = (const uint8_t *)rsp;

    for (uint32_t i = 0; i < sizeof(*rsp); i++) {
        while (uart_send_byte(BOARD_CONSOLE_UART_BASE, p[i]) != status_success) {
        }
    }
    return 0;
}

#endif /* USE_UART3 */
