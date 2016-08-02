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
	@echo 'Invoking: Cross GCC Compiler'
	msp430-gcc -std=c90 -ansi -D__MSP430G2553__ -I../Source -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_MSP430G2553 -Os -g3 -pedantic -Wall -Wextra -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


