################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Source/subdir.mk
-include Arduinutil/port/GCC_ATmega328P/subdir.mk
-include Arduinutil/Data/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
LSS += \
a328P.lss \
a328P.lss \

FLASH_IMAGE += \
a328P.hex \

EEPROM_IMAGE += \
a328P.eep \

SIZEDUMMY += \
sizedummy \
sizedummy \


# All Target
all: a328P.elf secondary-outputs

# Tool invocations
a328P.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: AVR C Linker'
	avr-gcc -Wl,-Map,a328P.map -Wl,--gc-sections -mmcu=atmega328p -o "a328P.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

a328P.lss: a328P.elf
	@echo 'Invoking: AVR Create Extended Listing'
	-avr-objdump -h -S a328P.elf  >"a328P.lss"
	@echo 'Finished building: $@'
	@echo ' '

a328P.hex: a328P.elf
	@echo 'Create Flash image (ihex format)'
	-avr-objcopy -R .eeprom -R .fuse -R .lock -R .signature -O ihex a328P.elf  "a328P.hex"
	@echo 'Finished building: $@'
	@echo ' '

a328P.eep: a328P.elf
	@echo 'Create eeprom image (ihex format)'
	-avr-objcopy -j .eeprom --no-change-warnings --change-section-lma .eeprom=0 -O ihex a328P.elf  "a328P.eep"
	@echo 'Finished building: $@'
	@echo ' '

sizedummy: a328P.elf
	@echo 'Invoking: Print Size'
	-avr-size --format=avr --mcu=atmega328p a328P.elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(ASM_DEPS)$(EEPROM_IMAGE)$(FLASH_IMAGE)$(ELFS)$(LSS)$(S_DEPS)$(SIZEDUMMY)$(S_UPPER_DEPS) a328P.elf
	-@echo ' '

secondary-outputs: $(LSS) $(FLASH_IMAGE) $(EEPROM_IMAGE) $(SIZEDUMMY)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
