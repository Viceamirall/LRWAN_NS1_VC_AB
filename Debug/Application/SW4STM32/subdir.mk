################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/STM32CubeIDE/startup_stm32l073xx.s 

C_SRCS += \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/STM32CubeIDE/syscalls.c 

OBJS += \
./Application/SW4STM32/startup_stm32l073xx.o \
./Application/SW4STM32/syscalls.o 

S_DEPS += \
./Application/SW4STM32/startup_stm32l073xx.d 

C_DEPS += \
./Application/SW4STM32/syscalls.d 


# Each subdirectory must supply rules for building sources it contributes
Application/SW4STM32/startup_stm32l073xx.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/STM32CubeIDE/startup_stm32l073xx.s Application/SW4STM32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m0plus -g3 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"
Application/SW4STM32/syscalls.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/STM32CubeIDE/syscalls.c Application/SW4STM32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -Werror -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Application-2f-SW4STM32

clean-Application-2f-SW4STM32:
	-$(RM) ./Application/SW4STM32/startup_stm32l073xx.d ./Application/SW4STM32/startup_stm32l073xx.o ./Application/SW4STM32/syscalls.cyclo ./Application/SW4STM32/syscalls.d ./Application/SW4STM32/syscalls.o ./Application/SW4STM32/syscalls.su

.PHONY: clean-Application-2f-SW4STM32

