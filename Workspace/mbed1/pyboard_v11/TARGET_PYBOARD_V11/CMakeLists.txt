# Copyright (c) 2020 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

add_library(mbed-pyboard-v11 INTERFACE)

target_sources(mbed-pyboard-v11
    INTERFACE
        PeripheralPins.c
)

target_include_directories(mbed-pyboard-v11
    INTERFACE
        .
)

target_link_libraries(mbed-pyboard-v11 INTERFACE mbed-stm32f405xg)