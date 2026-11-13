/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * SPI6 + GD25B512ME (64 MByte) NOR flash driver wrapper.
 * Uses the HPM SDK serial NOR component (SFDP based) in single-I/O mode.
 */

#ifndef SPI6_NOR_H
#define SPI6_NOR_H

#include <stdint.h>

#include "board.h"

#define SPI6_NOR_SPI_BASE       HPM_SPI6
#define SPI6_NOR_CS_PAD         IOC_PAD_PB21
#define SPI6_NOR_CLK_HZ         (50000000u)

int spi6_nor_init(void);
int spi6_nor_is_ready(void);
int spi6_nor_read_jedec(uint8_t id[3]);

uint32_t spi6_nor_capacity_bytes(void);
uint32_t spi6_nor_sector_size(void);
uint32_t spi6_nor_page_size(void);

int spi6_nor_read(uint32_t address, uint8_t *buffer, uint32_t length);
int spi6_nor_program(uint32_t address, const uint8_t *buffer, uint32_t length);
int spi6_nor_erase(uint32_t address, uint32_t length);

#endif /* SPI6_NOR_H */
