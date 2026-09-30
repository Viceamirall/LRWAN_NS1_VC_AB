################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/LoRaWAN/App/app_master.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/LoRaWAN/App/lora_driver.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/LoRaWAN/App/master_app.c 

OBJS += \
./Application/App/app_master.o \
./Application/App/lora_driver.o \
./Application/App/master_app.o 

C_DEPS += \
./Application/App/app_master.d \
./Application/App/lora_driver.d \
./Application/App/master_app.d 


# Each subdirectory must supply rules for building sources it contributes
Application/App/app_master.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/LoRaWAN/App/app_master.c Application/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Application/App/lora_driver.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/LoRaWAN/App/lora_driver.c Application/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Application/App/master_app.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Projects/NUCLEO-L073RZ/Applications/LoRaWAN/LoRaWAN_AT_Master/LoRaWAN/App/master_app.c Application/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Application-2f-App

clean-Application-2f-App:
	-$(RM) ./Application/App/app_master.cyclo ./Application/App/app_master.d ./Application/App/app_master.o ./Application/App/app_master.su ./Application/App/lora_driver.cyclo ./Application/App/lora_driver.d ./Application/App/lora_driver.o ./Application/App/lora_driver.su ./Application/App/master_app.cyclo ./Application/App/master_app.d ./Application/App/master_app.o ./Application/App/master_app.su

.PHONY: clean-Application-2f-App

