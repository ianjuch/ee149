#! /bin/bash

msp430-gcc -o basic_wifi_application.elf basic_wifi_application.c -I ../CC3000HostDriver/ -I ../CC3000\ Spi/ -I ../HyperTerminal\ Driver/ -I ../inc/
