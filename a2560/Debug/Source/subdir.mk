################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Source/main.c 

OBJS += \
./Source/main.o 

C_DEPS += \
./Source/main.d 


# Each subdirectory must supply rules for building sources it contributes
Source/%.o: ../Source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I../Source -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_ATmega2560 -g2 -gstabs -O0 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -ansi -funsigned-char -funsigned-bitfields -pedantic -Wall -Wextra -mmcu=atmega2560 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


