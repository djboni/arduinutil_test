################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Arduinutil/port/GCC_ATmega2560/Analog.c \
../Arduinutil/port/GCC_ATmega2560/Arduinutil.c \
../Arduinutil/port/GCC_ATmega2560/Digital.c \
../Arduinutil/port/GCC_ATmega2560/Serial.c \
../Arduinutil/port/GCC_ATmega2560/Timer.c 

OBJS += \
./Arduinutil/port/GCC_ATmega2560/Analog.o \
./Arduinutil/port/GCC_ATmega2560/Arduinutil.o \
./Arduinutil/port/GCC_ATmega2560/Digital.o \
./Arduinutil/port/GCC_ATmega2560/Serial.o \
./Arduinutil/port/GCC_ATmega2560/Timer.o 

C_DEPS += \
./Arduinutil/port/GCC_ATmega2560/Analog.d \
./Arduinutil/port/GCC_ATmega2560/Arduinutil.d \
./Arduinutil/port/GCC_ATmega2560/Digital.d \
./Arduinutil/port/GCC_ATmega2560/Serial.d \
./Arduinutil/port/GCC_ATmega2560/Timer.d 


# Each subdirectory must supply rules for building sources it contributes
Arduinutil/port/GCC_ATmega2560/%.o: ../Arduinutil/port/GCC_ATmega2560/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I../Source -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_ATmega2560 -g2 -gstabs -Os -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -ansi -funsigned-char -funsigned-bitfields -pedantic -pedantic-errors -Wall -Wextra -Werror -mmcu=atmega2560 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


