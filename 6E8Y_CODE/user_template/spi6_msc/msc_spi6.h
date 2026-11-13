/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef MSC_SPI6_H
#define MSC_SPI6_H

#include <stdint.h>

int msc_spi6_init(uint8_t busid, uint32_t reg_base);
int msc_spi6_flush(void);

#endif /* MSC_SPI6_H */
