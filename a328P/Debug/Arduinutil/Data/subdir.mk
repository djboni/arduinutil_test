################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Arduinutil/Data/mailbox.c \
../Arduinutil/Data/mutex.c \
../Arduinutil/Data/queue.c \
../Arduinutil/Data/semphr.c 

OBJS += \
./Arduinutil/Data/mailbox.o \
./Arduinutil/Data/mutex.o \
./Arduinutil/Data/queue.o \
./Arduinutil/Data/semphr.o 

C_DEPS += \
./Arduinutil/Data/mailbox.d \
./Arduinutil/Data/mutex.d \
./Arduinutil/Data/queue.d \
./Arduinutil/Data/semphr.d 


# Each subdirectory must supply rules for building sources it contributes
Arduinutil/Data/%.o: ../Arduinutil/Data/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I../Source -I../Arduinutil -I../Arduinutil/port/GCC_ATmega328P -g2 -gstabs -Os -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -ansi -funsigned-char -funsigned-bitfields -pedantic -pedantic-errors -Wall -Wextra -Werror -mmcu=atmega328p -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


