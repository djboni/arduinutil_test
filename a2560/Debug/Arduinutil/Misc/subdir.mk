################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Arduinutil/Misc/convintstr.c \
../Arduinutil/Misc/hexdump.c 

OBJS += \
./Arduinutil/Misc/convintstr.o \
./Arduinutil/Misc/hexdump.o 

C_DEPS += \
./Arduinutil/Misc/convintstr.d \
./Arduinutil/Misc/hexdump.d 


# Each subdirectory must supply rules for building sources it contributes
Arduinutil/Misc/%.o: ../Arduinutil/Misc/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I../Source -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_ATmega2560 -g2 -gstabs -Os -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -ansi -funsigned-char -funsigned-bitfields -pedantic -pedantic-errors -Wall -Wextra -Werror -mmcu=atmega2560 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


