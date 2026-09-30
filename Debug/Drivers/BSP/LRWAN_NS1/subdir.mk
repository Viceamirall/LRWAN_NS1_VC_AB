################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.c 

OBJS += \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1.o \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.o \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.o \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.o \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.o \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.o 

C_DEPS += \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1.d \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.d \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.d \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.d \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.d \
./Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/LRWAN_NS1/lrwan_ns1.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1.c Drivers/BSP/LRWAN_NS1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.c Drivers/BSP/LRWAN_NS1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.c Drivers/BSP/LRWAN_NS1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.c Drivers/BSP/LRWAN_NS1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.c Drivers/BSP/LRWAN_NS1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.c Drivers/BSP/LRWAN_NS1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-LRWAN_NS1

clean-Drivers-2f-BSP-2f-LRWAN_NS1:
	-$(RM) ./Drivers/BSP/LRWAN_NS1/lrwan_ns1.cyclo ./Drivers/BSP/LRWAN_NS1/lrwan_ns1.d ./Drivers/BSP/LRWAN_NS1/lrwan_ns1.o ./Drivers/BSP/LRWAN_NS1/lrwan_ns1.su ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.cyclo ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.d ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.o ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_atcmd.su ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.cyclo ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.d ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.o ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_humidity.su ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.cyclo ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.d ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.o ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_pressure.su ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.cyclo ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.d ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.o ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_printf.su ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.cyclo ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.d ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.o ./Drivers/BSP/LRWAN_NS1/lrwan_ns1_temperature.su

.PHONY: clean-Drivers-2f-BSP-2f-LRWAN_NS1

