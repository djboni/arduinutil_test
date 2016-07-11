################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Tests/Data/queue.cpp \
../Tests/Data/semphr.cpp 

OBJS += \
./Tests/Data/queue.o \
./Tests/Data/semphr.o 

CPP_DEPS += \
./Tests/Data/queue.d \
./Tests/Data/semphr.d 


# Each subdirectory must supply rules for building sources it contributes
Tests/Data/%.o: ../Tests/Data/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++98 -ansi -I../../a328P/Arduinutil -I../../a328P/Arduinutil/port/GCC_Linux -O0 -g3 -pedantic -pedantic-errors -Wall -Wextra -Werror -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


