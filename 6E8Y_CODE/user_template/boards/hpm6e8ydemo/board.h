/*
 * Copyright (c) 2024-2025 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#ifndef _HPM_BOARD_H
#define _HPM_BOARD_H
#include <stdio.h>
#include "hpm_common.h"
#include "hpm_soc.h"
#include "hpm_soc_feature.h"
#include "hpm_clock_drv.h"
#include "hpm_lobs_drv.h"
#include "hpm_trgm_drv.h"
#include "pinmux.h"
#include "ftconfig.h"
#if !defined(CONFIG_NDEBUG_CONSOLE) || !CONFIG_NDEBUG_CONSOLE
#include "hpm_debug_console.h"
#endif
#if defined(CONFIG_ENET_PHY) && CONFIG_ENET_PHY
#include "hpm_enet_phy.h"
#endif
#if defined(CONFIG_EEPROM_DEVICE_I2C)
#include "eeprom_device.h"
#endif

#define BOARD_NAME          "hpm6e8ydemo"
#define BOARD_UF2_SIGNATURE (0x0A4D5048UL)
#define BOARD_CPU_FREQ      (600000000UL)

#define SEC_CORE_IMG_START CORE1_ILM_LOCAL_BASE

#ifndef BOARD_RUNNING_CORE
#define BOARD_RUNNING_CORE HPM_CORE0
#endif

#if !defined(CONFIG_NDEBUG_CONSOLE) || !CONFIG_NDEBUG_CONSOLE
#ifndef BOARD_CONSOLE_TYPE
#define BOARD_CONSOLE_TYPE CONSOLE_TYPE_UART
#endif

#if BOARD_CONSOLE_TYPE == CONSOLE_TYPE_UART
#ifndef BOARD_CONSOLE_UART_BASE
#if BOARD_RUNNING_CORE == HPM_CORE0
#define BOARD_CONSOLE_UART_BASE       HPM_UART3
#define BOARD_CONSOLE_UART_CLK_NAME   clock_uart3
#define BOARD_CONSOLE_UART_IRQ        IRQn_UART3
#define BOARD_CONSOLE_UART_TX_DMA_REQ HPM_DMA_SRC_UART3_TX
#define BOARD_CONSOLE_UART_RX_DMA_REQ HPM_DMA_SRC_UART3_RX
#else
#define BOARD_CONSOLE_UART_BASE       HPM_UART11
#define BOARD_CONSOLE_UART_CLK_NAME   clock_uart11
#define BOARD_CONSOLE_UART_IRQ        IRQn_UART11
#define BOARD_CONSOLE_UART_TX_DMA_REQ HPM_DMA_SRC_UART11_TX
#define BOARD_CONSOLE_UART_RX_DMA_REQ HPM_DMA_SRC_UART11_RX
#endif
#endif
#define BOARD_CONSOLE_UART_BAUDRATE (2000000UL)
#endif
#endif

/* rtthread-nano finsh section */
#define BOARD_RT_CONSOLE_BASE        BOARD_CONSOLE_UART_BASE
#define BOARD_RT_CONSOLE_CLK_NAME    BOARD_CONSOLE_UART_CLK_NAME
#define BOARD_RT_CONSOLE_IRQ         BOARD_CONSOLE_UART_IRQ

/* nor flash section */
#define BOARD_FLASH_BASE_ADDRESS (0x80000000UL)
#define BOARD_FLASH_SIZE         (4 * SIZE_1MB)

/*
 * timer for board delay
 */
#define BOARD_DELAY_TIMER          (HPM_GPTMR3)
#define BOARD_DELAY_TIMER_CH       0
#define BOARD_DELAY_TIMER_CLK_NAME (clock_gptmr3)

#define BOARD_CALLBACK_TIMER          (HPM_GPTMR3)
#define BOARD_CALLBACK_TIMER_CH       1
#define BOARD_CALLBACK_TIMER_IRQ      IRQn_GPTMR3
#define BOARD_CALLBACK_TIMER_CLK_NAME (clock_gptmr3)

/* Threadx Definitions */
#define BOARD_THREADX_TIMER          HPM_GPTMR6
#define BOARD_THREADX_TIMER_CHANNEL  1
#define BOARD_THREADX_TIMER_IRQ      IRQn_GPTMR6
#define BOARD_THREADX_TIMER_CLK_NAME clock_gptmr6

#define BOARD_THREADX_LOWPOWER_TIMER          HPM_PTMR
#define BOARD_THREADX_LOWPOWER_TIMER_CHANNEL  1
#define BOARD_THREADX_LOWPOWER_TIMER_IRQ      IRQn_PTMR
#define BOARD_THREADX_LOWPOWER_TIMER_CLK_NAME clock_ptmr

#if defined(__cplusplus)
extern "C" {
#endif /* __cplusplus */

typedef void (*board_timer_cb)(void);

void board_init(void);
void board_init_console(void);
void board_init_core1(void);


/* Initialize SoC overall clocks */
void board_init_clock(void);
void board_init_io(void);

/*
 * @brief Initialize PMP and PMA for but not limited to the following purposes:
 *      -- non-cacheable memory initialization
 */
void board_init_pmp(void);
void board_delay_us(uint32_t us);
void board_delay_ms(uint32_t ms);
void board_timer_create(uint32_t ms, board_timer_cb cb);




#if defined(__cplusplus)
}
#endif /* __cplusplus */
#endif /* _HPM_BOARD_H */
