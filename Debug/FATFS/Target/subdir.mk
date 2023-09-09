################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FATFS/Target/usbh_diskio.c 

C_DEPS += \
./FATFS/Target/usbh_diskio.d 

OBJS += \
./FATFS/Target/usbh_diskio.o 


# Each subdirectory must supply rules for building sources it contributes
FATFS/Target/%.o FATFS/Target/%.su: ../FATFS/Target/%.c FATFS/Target/subdir.mk
	arm-none-eabi-gcc -fno-builtin-fabs "$<" -mcpu=cortex-m7 -std=c99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../USB_HOST/App -I../USB_HOST/Target -I../FATFS/Target -I../FATFS/App -I../Drivers/CMSIS/Include -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I"C:/Users/pmpin/Documents/WINTER 2023/ECE113DB/Week 2/mandarin_base_update2/Mandarin_base/Libraries/dsp-c-filters-master/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-FATFS-2f-Target

clean-FATFS-2f-Target:
	-$(RM) ./FATFS/Target/usbh_diskio.d ./FATFS/Target/usbh_diskio.o ./FATFS/Target/usbh_diskio.su

.PHONY: clean-FATFS-2f-Target

