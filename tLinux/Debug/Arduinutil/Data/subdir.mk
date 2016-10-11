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
	@echo 'Invoking: GCC C Compiler'
	gcc -std=c90 -ansi -Dhexdump_write=puts -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_Linux -O0 -g3 -pedantic -pedantic-errors -Wall -Wextra -Werror -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


