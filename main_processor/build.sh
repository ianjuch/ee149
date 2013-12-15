#!/bin/bash

MCU=msp430g2955
msp430-gcc -std=c99 -Os -Wall -g -mmcu=$MCU -o main-$MCU.elf main.c
sudo mspdebug rf2500 "prog main-$MCU.elf"
