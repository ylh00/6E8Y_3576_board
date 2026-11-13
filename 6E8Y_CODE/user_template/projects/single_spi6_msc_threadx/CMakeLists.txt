# Copyright (c) 2026 HPMicro
# SPDX-License-Identifier: BSD-3-Clause
#
# ThreadX single-core (core0) SPI6 GD25 flash -> CherryUSB MSC U-disk.

cmake_minimum_required(VERSION 3.13)

set(CONFIG_CHERRYUSB 1)
set(CONFIG_USB_DEVICE 1)
set(CONFIG_USB_DEVICE_MSC 1)

set(CONFIG_ECLIPSE_THREADX 1)

find_package(hpm-sdk REQUIRED HINTS $ENV{HPM_SDK_BASE})

project(single_spi6_msc_threadx)

sdk_inc(${HPM_SDK_BASE}/samples/cherryusb/config)
sdk_inc(src)
sdk_inc(../../spi6_msc)

# Move MSC read/write to its own ThreadX thread; NOR erase can block for ms.
sdk_compile_definitions(-DCONFIG_USBDEV_MSC_THREAD=1)
sdk_compile_definitions(-DCONFIG_USBDEV_MSC_STACKSIZE=4096)
sdk_compile_definitions(-DCONFIG_USBDEV_MSC_MAX_BUFSIZE=512)

sdk_app_src(src/main.c)
sdk_app_src(../../spi6_msc/spi6_nor.c)
sdk_app_src(../../spi6_msc/msc_spi6.c)
sdk_app_src(src/usb_osal_threadx.c)

generate_ide_projects()
