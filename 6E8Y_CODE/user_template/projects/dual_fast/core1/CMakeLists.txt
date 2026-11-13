# Copyright (c) 2026 HPMicro
# SPDX-License-Identifier: BSD-3-Clause

cmake_minimum_required(VERSION 3.13)

set(HPM_BUILD_TYPE "sec_core_img")
set(SEC_CORE_IMG_C_ARRAY_OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/../core0/src/sec_core_img.c)



include(${CMAKE_CURRENT_LIST_DIR}/../../cmake/fc_esc_project.cmake)

find_package(hpm-sdk REQUIRED HINTS $ENV{HPM_SDK_BASE})

project(dual_fast_core1)

sdk_app_inc(src)
sdk_app_src(src/main.c)



hpm_fc_esc_add()
hpm_fc_esc_add_all_modules()

generate_ide_projects()
