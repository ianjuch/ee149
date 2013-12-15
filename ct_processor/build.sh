#!/bin/bash

MCU=msp430g2553
msp430-gcc -Os -Wall -std=c99 -g -mmcu=$MCU -o main-$MCU.elf main.c
sudo mspdebug rf2500 "prog main-$MCU.elf"
