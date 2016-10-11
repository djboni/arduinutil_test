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
	@echo 'Invoking: GCC C Compiler'
	gcc -std=c90 -ansi -Dhexdump_write=puts -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_Linux -O0 -g3 -pedantic -pedantic-errors -Wall -Wextra -Werror -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


