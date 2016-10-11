################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Tests/Misc/convintstr.cpp 

OBJS += \
./Tests/Misc/convintstr.o 

CPP_DEPS += \
./Tests/Misc/convintstr.d 


# Each subdirectory must supply rules for building sources it contributes
Tests/Misc/%.o: ../Tests/Misc/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -ansi -std=c++11 -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_Linux -O0 -g3 -pedantic -pedantic-errors -Wall -Wextra -Werror -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


