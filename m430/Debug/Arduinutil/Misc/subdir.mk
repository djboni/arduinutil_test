################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Arduinutil/Misc/convintstr.c 

OBJS += \
./Arduinutil/Misc/convintstr.o 

C_DEPS += \
./Arduinutil/Misc/convintstr.d 


# Each subdirectory must supply rules for building sources it contributes
Arduinutil/Misc/%.o: ../Arduinutil/Misc/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	msp430-gcc -std=c90 -ansi -DF_CPU=1000000UL -I../Source -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_MSP430G2553 -Os -g3 -pedantic -pedantic-errors -Wall -Wextra -Werror -mmcu=msp430g2553 -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


