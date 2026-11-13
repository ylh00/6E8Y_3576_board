# Copyright (c) 2026 HPMicro
# SPDX-License-Identifier: BSD-3-Clause

cmake_minimum_required(VERSION 3.13)

if("${HPM_BUILD_TYPE}" STREQUAL "")
    set(HPM_BUILD_TYPE flash_xip)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/../../cmake/fc_esc_project.cmake)

find_package(hpm-sdk REQUIRED HINTS $ENV{HPM_SDK_BASE})

project(dual_fc_esc_core0)

sdk_app_inc(src)
sdk_app_inc(${HPM_SDK_BASE}/samples/multicore/common)
sdk_app_src(src/main.c src/sec_core_img.c)
sdk_app_src(${HPM_SDK_BASE}/samples/multicore/common/multicore_common.c)

hpm_fc_esc_add()
hpm_fc_esc_add_all_modules()

generate_ide_projects()
