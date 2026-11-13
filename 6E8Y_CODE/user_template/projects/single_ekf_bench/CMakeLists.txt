# Copyright (c) 2026 HPMicro
# SPDX-License-Identifier: BSD-3-Clause
#
# Single-core 24-state EKF + quadrotor rate-control benchmark.
# Target: HPM6E8Y (HPM6E80, core0 only)
# Toolchain: Andes nds-gcc (riscv32-elf-gcc), FPU enabled (ilp32d)
# Transport: CherryUSB WinUSB by default, UART3 @ 2Mbaud with -DUSE_UART3=ON

cmake_minimum_required(VERSION 3.13)

# ---- SDK middleware selection (must be before find_package) ----
set(CONFIG_CHERRYUSB 1)
set(CONFIG_CHERRYUSB_DEVICE 1)
set(CONFIG_USB_DEVICE 1)

set(CONFIG_HPM_MATH 1)
set(CONFIG_HPM_MATH_DSP 1)
# Used by the SES/IAR project generator; GCC links -ldsp directly.
set(HPM_MATH_DSP_SES_LIB "libdspd")

# ---- FPU: HPM6E80 supports RV32IMAFDC, Andes toolchain default is ilp32d ----
set(RV_ARCH "rv32imafdc")
set(RV_ABI "ilp32d")

if("${HPM_BUILD_TYPE}" STREQUAL "")
    set(HPM_BUILD_TYPE flash_xip)
endif()
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE release)
endif()

option(USE_UART3 "Use UART3 at 2 Mbaud instead of CherryUSB WinUSB" OFF)

# hpm_math requires the Andes nds-gcc toolchain.
if(NOT DEFINED ENV{HPM_SDK_TOOLCHAIN_VARIANT})
    set(ENV{HPM_SDK_TOOLCHAIN_VARIANT} "nds-gcc")
endif()

find_package(hpm-sdk REQUIRED HINTS $ENV{HPM_SDK_BASE})

project(single_ekf_bench)

# Andes DSP extension used by hpm_math / riscv_dsp matrix functions.
sdk_compile_options("-mext-dsp")
sdk_compile_options("-ffast-math")
sdk_ld_options("-mext-dsp")

sdk_compile_definitions(-DDOUBLE_WINUSB=0)
if(USE_UART3)
    sdk_compile_definitions(-DUSE_UART3=1)
else()
    sdk_compile_definitions(-DUSE_UART3=0)
endif()

# CherryUSB example configuration (usb_config.h)
sdk_inc(${HPM_SDK_BASE}/samples/cherryusb/config)

sdk_app_inc(src)
sdk_app_src(
    src/main.c
    src/ekf24.c
    src/rate_control.c
    src/winusb_port.c
    src/uart_port.c
)

generate_ide_projects()

