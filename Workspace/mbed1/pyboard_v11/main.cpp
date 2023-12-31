/* mbed Microcontroller Library
 * Copyright (c) 2023 ARM Limited
 * SPDX-License-Identifier: Apache-2.0
 */

#include "mbed.h"

// Blinking rate in milliseconds
#define BLINKING_RATE     100ms

int main()
{
    printf("Hello, Mbed!\n");

    // Initialise the digital pin LED1 as an output
    #ifdef BLUE_LED
        DigitalOut led(BLUE_LED);
    #else
        bool led;
    #endif

    while (true) {
        printf("Hello, Mbed!\n");
        led = !led;
        ThisThread::sleep_for(BLINKING_RATE);
    }

    return 0;
}