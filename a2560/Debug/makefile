################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Source/subdir.mk
-include Arduinutil/port/GCC_ATmega2560/subdir.mk
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
a2560.lss \
a2560.lss \

FLASH_IMAGE += \
a2560.hex \

EEPROM_IMAGE += \
a2560.eep \

SIZEDUMMY += \
sizedummy \
sizedummy \


# All Target
all: a2560.elf secondary-outputs

# Tool invocations
a2560.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: AVR C Linker'
	avr-gcc -Wl,-Map,a2560.map -mmcu=atmega2560 -o "a2560.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

a2560.lss: a2560.elf
	@echo 'Invoking: AVR Create Extended Listing'
	-avr-objdump -h -S a2560.elf  >"a2560.lss"
	@echo 'Finished building: $@'
	@echo ' '

a2560.hex: a2560.elf
	@echo 'Create Flash image (ihex format)'
	-avr-objcopy -R .eeprom -R .fuse -R .lock -R .signature -O ihex a2560.elf  "a2560.hex"
	@echo 'Finished building: $@'
	@echo ' '

a2560.eep: a2560.elf
	@echo 'Create eeprom image (ihex format)'
	-avr-objcopy -j .eeprom --no-change-warnings --change-section-lma .eeprom=0 -O ihex a2560.elf  "a2560.eep"
	@echo 'Finished building: $@'
	@echo ' '

sizedummy: a2560.elf
	@echo 'Invoking: Print Size'
	-avr-size --format=avr --mcu=atmega2560 a2560.elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(ASM_DEPS)$(EEPROM_IMAGE)$(FLASH_IMAGE)$(ELFS)$(LSS)$(S_DEPS)$(SIZEDUMMY)$(S_UPPER_DEPS) a2560.elf
	-@echo ' '

secondary-outputs: $(LSS) $(FLASH_IMAGE) $(EEPROM_IMAGE) $(SIZEDUMMY)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
