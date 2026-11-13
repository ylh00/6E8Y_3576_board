# Copyright (c) 2026 HPMicro
# SPDX-License-Identifier: BSD-3-Clause
#
# Shared build helpers for the FC/ESC projects.
#
# - hpm_fc_esc_add(): add the shared source tree under user_template/hpm_fc_esc.
# - hpm_fc_esc_add_all_modules(): put all components/middleware sources and
#   headers into the project tree for reference. They are HEADER_FILE_ONLY,
#   so they are visible in the IDE but are not compiled. Enable a module with
#   its CONFIG_xxx variable when it is actually needed.
#
# NOTE: when enabling a module, add its directory to
# HPM_FC_ESC_MODULE_EXCLUDE_DIRS (or set HPM_FC_ESC_ADD_ALL_MODULES=OFF),
# otherwise its .c files stay HEADER_FILE_ONLY and are not compiled.

get_filename_component(HPM_FC_ESC_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../hpm_fc_esc" ABSOLUTE)

function(hpm_fc_esc_add)
    if(NOT EXISTS "${HPM_FC_ESC_ROOT}")
        return()
    endif()

    sdk_app_inc("${HPM_FC_ESC_ROOT}")
    if(EXISTS "${HPM_FC_ESC_ROOT}/include")
        sdk_app_inc("${HPM_FC_ESC_ROOT}/include")
    endif()

    file(GLOB_RECURSE _hpm_fc_esc_src
        "${HPM_FC_ESC_ROOT}/*.c"
        "${HPM_FC_ESC_ROOT}/*.S"
        "${HPM_FC_ESC_ROOT}/*.s")
    if(_hpm_fc_esc_src)
        sdk_app_src(${_hpm_fc_esc_src})
    endif()
endfunction()

option(HPM_FC_ESC_ADD_ALL_MODULES
    "Add all components/middleware files to the project tree (IDE-only)" ON)

function(hpm_fc_esc_add_all_modules)
    if(NOT HPM_FC_ESC_ADD_ALL_MODULES)
        return()
    endif()

    # These modules are compiled unconditionally by the SDK. Their sources
    # must not be marked HEADER_FILE_ONLY, otherwise the SDK library loses
    # the implementation.
    set(_hpm_skip_dirs
        "${HPM_SDK_BASE}/components/debug_console"
        "${HPM_SDK_BASE}/components/eeprom_hal"
        "${HPM_SDK_BASE}/middleware/CMSIS"
        "${HPM_SDK_BASE}/middleware/ptpd"
        "${HPM_SDK_BASE}/middleware/wifi"
        ${HPM_FC_ESC_MODULE_EXCLUDE_DIRS}
    )

    # Headers are never compiled; add them for IDE visibility.
    file(GLOB_RECURSE _hpm_module_headers
        "${HPM_SDK_BASE}/components/*.h"
        "${HPM_SDK_BASE}/middleware/*.h")

    # Sources from modules that are not enabled are added as IDE-only files.
    file(GLOB_RECURSE _hpm_module_sources
        "${HPM_SDK_BASE}/components/*.c"
        "${HPM_SDK_BASE}/middleware/*.c")

    foreach(_hpm_skip_dir ${_hpm_skip_dirs})
        list(FILTER _hpm_module_sources EXCLUDE REGEX "^${_hpm_skip_dir}/")
    endforeach()

    if(_hpm_module_headers)
        sdk_app_src(${_hpm_module_headers})
    endif()

    if(_hpm_module_sources)
        sdk_app_src(${_hpm_module_sources})
        set_source_files_properties(${_hpm_module_sources}
            PROPERTIES HEADER_FILE_ONLY TRUE)
    endif()
endfunction()
