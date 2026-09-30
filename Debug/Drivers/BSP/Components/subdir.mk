################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/hts221/HTS221_Driver.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/hts221/HTS221_Driver_HL.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps22hb/LPS22HB_Driver.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps22hb/LPS22HB_Driver_HL.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps25hb/LPS25HB_Driver.c \
/home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps25hb/LPS25HB_Driver_HL.c 

OBJS += \
./Drivers/BSP/Components/HTS221_Driver.o \
./Drivers/BSP/Components/HTS221_Driver_HL.o \
./Drivers/BSP/Components/LPS22HB_Driver.o \
./Drivers/BSP/Components/LPS22HB_Driver_HL.o \
./Drivers/BSP/Components/LPS25HB_Driver.o \
./Drivers/BSP/Components/LPS25HB_Driver_HL.o 

C_DEPS += \
./Drivers/BSP/Components/HTS221_Driver.d \
./Drivers/BSP/Components/HTS221_Driver_HL.d \
./Drivers/BSP/Components/LPS22HB_Driver.d \
./Drivers/BSP/Components/LPS22HB_Driver_HL.d \
./Drivers/BSP/Components/LPS25HB_Driver.d \
./Drivers/BSP/Components/LPS25HB_Driver_HL.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/HTS221_Driver.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/hts221/HTS221_Driver.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/HTS221_Driver_HL.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/hts221/HTS221_Driver_HL.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/LPS22HB_Driver.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps22hb/LPS22HB_Driver.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/LPS22HB_Driver_HL.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps22hb/LPS22HB_Driver_HL.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/LPS25HB_Driver.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps25hb/LPS25HB_Driver.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/LPS25HB_Driver_HL.o: /home/victor/STM32CubeIDE/lrwan_v2.1.0_lora/Drivers/BSP/Components/lps25hb/LPS25HB_Driver_HL.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L073xx -DUSE_BAND_868 -DUSE_STM32L0XX_NUCLEO -DUSE_LRWAN_NS1 -DCMD_DEBUG -c -I../../../Core/Inc -I../../../LoRaWAN/App -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc -I../../../../../../../../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../../Drivers/BSP/Components/lps25hb -I../../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../../Drivers/BSP/LRWAN_NS1 -I../../../../../../../../Drivers/BSP/STM32L0xx_Nucleo -I../../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../../Utilities/misc -I../../../../../../../../Utilities/timer -O0 -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components

clean-Drivers-2f-BSP-2f-Components:
	-$(RM) ./Drivers/BSP/Components/HTS221_Driver.cyclo ./Drivers/BSP/Components/HTS221_Driver.d ./Drivers/BSP/Components/HTS221_Driver.o ./Drivers/BSP/Components/HTS221_Driver.su ./Drivers/BSP/Components/HTS221_Driver_HL.cyclo ./Drivers/BSP/Components/HTS221_Driver_HL.d ./Drivers/BSP/Components/HTS221_Driver_HL.o ./Drivers/BSP/Components/HTS221_Driver_HL.su ./Drivers/BSP/Components/LPS22HB_Driver.cyclo ./Drivers/BSP/Components/LPS22HB_Driver.d ./Drivers/BSP/Components/LPS22HB_Driver.o ./Drivers/BSP/Components/LPS22HB_Driver.su ./Drivers/BSP/Components/LPS22HB_Driver_HL.cyclo ./Drivers/BSP/Components/LPS22HB_Driver_HL.d ./Drivers/BSP/Components/LPS22HB_Driver_HL.o ./Drivers/BSP/Components/LPS22HB_Driver_HL.su ./Drivers/BSP/Components/LPS25HB_Driver.cyclo ./Drivers/BSP/Components/LPS25HB_Driver.d ./Drivers/BSP/Components/LPS25HB_Driver.o ./Drivers/BSP/Components/LPS25HB_Driver.su ./Drivers/BSP/Components/LPS25HB_Driver_HL.cyclo ./Drivers/BSP/Components/LPS25HB_Driver_HL.d ./Drivers/BSP/Components/LPS25HB_Driver_HL.o ./Drivers/BSP/Components/LPS25HB_Driver_HL.su

.PHONY: clean-Drivers-2f-BSP-2f-Components

