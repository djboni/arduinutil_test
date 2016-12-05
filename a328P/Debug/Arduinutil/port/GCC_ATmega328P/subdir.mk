################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Arduinutil/port/GCC_ATmega328P/Analog.c \
../Arduinutil/port/GCC_ATmega328P/Arduinutil.c \
../Arduinutil/port/GCC_ATmega328P/Digital.c \
../Arduinutil/port/GCC_ATmega328P/I2c.c \
../Arduinutil/port/GCC_ATmega328P/Pwm.c \
../Arduinutil/port/GCC_ATmega328P/Serial.c \
../Arduinutil/port/GCC_ATmega328P/Timer.c \
../Arduinutil/port/GCC_ATmega328P/Watchdog.c 

OBJS += \
./Arduinutil/port/GCC_ATmega328P/Analog.o \
./Arduinutil/port/GCC_ATmega328P/Arduinutil.o \
./Arduinutil/port/GCC_ATmega328P/Digital.o \
./Arduinutil/port/GCC_ATmega328P/I2c.o \
./Arduinutil/port/GCC_ATmega328P/Pwm.o \
./Arduinutil/port/GCC_ATmega328P/Serial.o \
./Arduinutil/port/GCC_ATmega328P/Timer.o \
./Arduinutil/port/GCC_ATmega328P/Watchdog.o 

C_DEPS += \
./Arduinutil/port/GCC_ATmega328P/Analog.d \
./Arduinutil/port/GCC_ATmega328P/Arduinutil.d \
./Arduinutil/port/GCC_ATmega328P/Digital.d \
./Arduinutil/port/GCC_ATmega328P/I2c.d \
./Arduinutil/port/GCC_ATmega328P/Pwm.d \
./Arduinutil/port/GCC_ATmega328P/Serial.d \
./Arduinutil/port/GCC_ATmega328P/Timer.d \
./Arduinutil/port/GCC_ATmega328P/Watchdog.d 


# Each subdirectory must supply rules for building sources it contributes
Arduinutil/port/GCC_ATmega328P/%.o: ../Arduinutil/port/GCC_ATmega328P/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I../Source -I../Arduinutil -I../Arduinutil/port/GCC_ATmega328P -g2 -gstabs -Os -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -ansi -funsigned-char -funsigned-bitfields -pedantic -pedantic-errors -Wall -Wextra -Werror -mmcu=atmega328p -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


