################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Arduinutil/port/GCC_MSP430G2553/Arduinutil.c \
../Arduinutil/port/GCC_MSP430G2553/Digital.c 

OBJS += \
./Arduinutil/port/GCC_MSP430G2553/Arduinutil.o \
./Arduinutil/port/GCC_MSP430G2553/Digital.o 

C_DEPS += \
./Arduinutil/port/GCC_MSP430G2553/Arduinutil.d \
./Arduinutil/port/GCC_MSP430G2553/Digital.d 


# Each subdirectory must supply rules for building sources it contributes
Arduinutil/port/GCC_MSP430G2553/%.o: ../Arduinutil/port/GCC_MSP430G2553/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	msp430-gcc -std=c90 -ansi -D__MSP430G2553__ -I../Source -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_MSP430G2553 -Os -g3 -pedantic -pedantic-errors -Wall -Wextra -Werror -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


