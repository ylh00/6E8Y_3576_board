/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef TRANSPORT_H
#define TRANSPORT_H

#include "protocol.h"

int transport_init(void);
int transport_read(proto_request_t *req);
int transport_write(const proto_response_t *rsp);

#endif /* TRANSPORT_H */
