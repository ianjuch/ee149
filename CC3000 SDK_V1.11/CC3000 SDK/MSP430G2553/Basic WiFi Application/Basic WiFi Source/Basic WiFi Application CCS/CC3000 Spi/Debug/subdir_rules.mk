################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
spi.obj: /home/ian/CC3000\ SDK_V1.11/CC3000\ SDK/MSP430G2553/Basic\ WiFi\ Application/Basic\ WiFi\ Source/Source/CC3000\ Spi/spi.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"/opt/ti/ccsv5/tools/compiler/msp430_4.2.1/bin/cl430" -vmsp --abi=eabi -O2 --opt_for_speed=0 -g --include_path="/opt/ti/ccsv5/ccs_base/msp430/include" --include_path="/home/ian/CC3000 SDK_V1.11/CC3000 SDK/MSP430G2553/Basic WiFi Application/Basic WiFi Source/Source/BasicWiFi Application" --include_path="/home/ian/CC3000 SDK_V1.11/CC3000 SDK/MSP430G2553/Basic WiFi Application/Basic WiFi Source/Source/inc" --include_path="/home/ian/CC3000 SDK_V1.11/CC3000 SDK/MSP430G2553/Basic WiFi Application/Basic WiFi Source/Source/CC3000HostDriver" --include_path="/opt/ti/ccsv5/tools/compiler/msp430_4.2.1/include" --advice:power="all" --define=__MSP430G2553__ --define=CC3000_UNENCRYPTED_SMART_CONFIG --define=CC3000_TINY_DRIVER --define=__CCS__ --diag_warning=225 --display_error_number --printf_support=minimal --preproc_with_compile --preproc_dependency="spi.pp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


