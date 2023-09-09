################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/dsp-c-filters-master/src/fo_apf.c \
../Libraries/dsp-c-filters-master/src/fo_hpf.c \
../Libraries/dsp-c-filters-master/src/fo_lpf.c \
../Libraries/dsp-c-filters-master/src/fo_shelving_high.c \
../Libraries/dsp-c-filters-master/src/fo_shelving_low.c \
../Libraries/dsp-c-filters-master/src/so_apf.c \
../Libraries/dsp-c-filters-master/src/so_bpf.c \
../Libraries/dsp-c-filters-master/src/so_bsf.c \
../Libraries/dsp-c-filters-master/src/so_butterworth_bpf.c \
../Libraries/dsp-c-filters-master/src/so_butterworth_bsf.c \
../Libraries/dsp-c-filters-master/src/so_butterworth_hpf.c \
../Libraries/dsp-c-filters-master/src/so_butterworth_lpf.c \
../Libraries/dsp-c-filters-master/src/so_hpf.c \
../Libraries/dsp-c-filters-master/src/so_linkwitz_riley_hpf.c \
../Libraries/dsp-c-filters-master/src/so_linkwitz_riley_lpf.c \
../Libraries/dsp-c-filters-master/src/so_lpf.c \
../Libraries/dsp-c-filters-master/src/so_parametric_cq_boost.c \
../Libraries/dsp-c-filters-master/src/so_parametric_cq_cut.c \
../Libraries/dsp-c-filters-master/src/so_parametric_ncq.c 

C_DEPS += \
./Libraries/dsp-c-filters-master/src/fo_apf.d \
./Libraries/dsp-c-filters-master/src/fo_hpf.d \
./Libraries/dsp-c-filters-master/src/fo_lpf.d \
./Libraries/dsp-c-filters-master/src/fo_shelving_high.d \
./Libraries/dsp-c-filters-master/src/fo_shelving_low.d \
./Libraries/dsp-c-filters-master/src/so_apf.d \
./Libraries/dsp-c-filters-master/src/so_bpf.d \
./Libraries/dsp-c-filters-master/src/so_bsf.d \
./Libraries/dsp-c-filters-master/src/so_butterworth_bpf.d \
./Libraries/dsp-c-filters-master/src/so_butterworth_bsf.d \
./Libraries/dsp-c-filters-master/src/so_butterworth_hpf.d \
./Libraries/dsp-c-filters-master/src/so_butterworth_lpf.d \
./Libraries/dsp-c-filters-master/src/so_hpf.d \
./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_hpf.d \
./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_lpf.d \
./Libraries/dsp-c-filters-master/src/so_lpf.d \
./Libraries/dsp-c-filters-master/src/so_parametric_cq_boost.d \
./Libraries/dsp-c-filters-master/src/so_parametric_cq_cut.d \
./Libraries/dsp-c-filters-master/src/so_parametric_ncq.d 

OBJS += \
./Libraries/dsp-c-filters-master/src/fo_apf.o \
./Libraries/dsp-c-filters-master/src/fo_hpf.o \
./Libraries/dsp-c-filters-master/src/fo_lpf.o \
./Libraries/dsp-c-filters-master/src/fo_shelving_high.o \
./Libraries/dsp-c-filters-master/src/fo_shelving_low.o \
./Libraries/dsp-c-filters-master/src/so_apf.o \
./Libraries/dsp-c-filters-master/src/so_bpf.o \
./Libraries/dsp-c-filters-master/src/so_bsf.o \
./Libraries/dsp-c-filters-master/src/so_butterworth_bpf.o \
./Libraries/dsp-c-filters-master/src/so_butterworth_bsf.o \
./Libraries/dsp-c-filters-master/src/so_butterworth_hpf.o \
./Libraries/dsp-c-filters-master/src/so_butterworth_lpf.o \
./Libraries/dsp-c-filters-master/src/so_hpf.o \
./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_hpf.o \
./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_lpf.o \
./Libraries/dsp-c-filters-master/src/so_lpf.o \
./Libraries/dsp-c-filters-master/src/so_parametric_cq_boost.o \
./Libraries/dsp-c-filters-master/src/so_parametric_cq_cut.o \
./Libraries/dsp-c-filters-master/src/so_parametric_ncq.o 


# Each subdirectory must supply rules for building sources it contributes
Libraries/dsp-c-filters-master/src/%.o Libraries/dsp-c-filters-master/src/%.su: ../Libraries/dsp-c-filters-master/src/%.c Libraries/dsp-c-filters-master/src/subdir.mk
	arm-none-eabi-gcc -fno-builtin-fabs "$<" -mcpu=cortex-m7 -std=c99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../USB_HOST/App -I../USB_HOST/Target -I../FATFS/Target -I../FATFS/App -I../Drivers/CMSIS/Include -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I"C:/Users/pmpin/Documents/WINTER 2023/ECE113DB/Week 2/mandarin_base_update2/Mandarin_base/Libraries/dsp-c-filters-master/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libraries-2f-dsp-2d-c-2d-filters-2d-master-2f-src

clean-Libraries-2f-dsp-2d-c-2d-filters-2d-master-2f-src:
	-$(RM) ./Libraries/dsp-c-filters-master/src/fo_apf.d ./Libraries/dsp-c-filters-master/src/fo_apf.o ./Libraries/dsp-c-filters-master/src/fo_apf.su ./Libraries/dsp-c-filters-master/src/fo_hpf.d ./Libraries/dsp-c-filters-master/src/fo_hpf.o ./Libraries/dsp-c-filters-master/src/fo_hpf.su ./Libraries/dsp-c-filters-master/src/fo_lpf.d ./Libraries/dsp-c-filters-master/src/fo_lpf.o ./Libraries/dsp-c-filters-master/src/fo_lpf.su ./Libraries/dsp-c-filters-master/src/fo_shelving_high.d ./Libraries/dsp-c-filters-master/src/fo_shelving_high.o ./Libraries/dsp-c-filters-master/src/fo_shelving_high.su ./Libraries/dsp-c-filters-master/src/fo_shelving_low.d ./Libraries/dsp-c-filters-master/src/fo_shelving_low.o ./Libraries/dsp-c-filters-master/src/fo_shelving_low.su ./Libraries/dsp-c-filters-master/src/so_apf.d ./Libraries/dsp-c-filters-master/src/so_apf.o ./Libraries/dsp-c-filters-master/src/so_apf.su ./Libraries/dsp-c-filters-master/src/so_bpf.d ./Libraries/dsp-c-filters-master/src/so_bpf.o ./Libraries/dsp-c-filters-master/src/so_bpf.su ./Libraries/dsp-c-filters-master/src/so_bsf.d ./Libraries/dsp-c-filters-master/src/so_bsf.o ./Libraries/dsp-c-filters-master/src/so_bsf.su ./Libraries/dsp-c-filters-master/src/so_butterworth_bpf.d ./Libraries/dsp-c-filters-master/src/so_butterworth_bpf.o ./Libraries/dsp-c-filters-master/src/so_butterworth_bpf.su ./Libraries/dsp-c-filters-master/src/so_butterworth_bsf.d ./Libraries/dsp-c-filters-master/src/so_butterworth_bsf.o ./Libraries/dsp-c-filters-master/src/so_butterworth_bsf.su ./Libraries/dsp-c-filters-master/src/so_butterworth_hpf.d ./Libraries/dsp-c-filters-master/src/so_butterworth_hpf.o ./Libraries/dsp-c-filters-master/src/so_butterworth_hpf.su ./Libraries/dsp-c-filters-master/src/so_butterworth_lpf.d ./Libraries/dsp-c-filters-master/src/so_butterworth_lpf.o ./Libraries/dsp-c-filters-master/src/so_butterworth_lpf.su ./Libraries/dsp-c-filters-master/src/so_hpf.d ./Libraries/dsp-c-filters-master/src/so_hpf.o ./Libraries/dsp-c-filters-master/src/so_hpf.su ./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_hpf.d ./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_hpf.o ./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_hpf.su ./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_lpf.d ./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_lpf.o ./Libraries/dsp-c-filters-master/src/so_linkwitz_riley_lpf.su ./Libraries/dsp-c-filters-master/src/so_lpf.d ./Libraries/dsp-c-filters-master/src/so_lpf.o ./Libraries/dsp-c-filters-master/src/so_lpf.su ./Libraries/dsp-c-filters-master/src/so_parametric_cq_boost.d ./Libraries/dsp-c-filters-master/src/so_parametric_cq_boost.o ./Libraries/dsp-c-filters-master/src/so_parametric_cq_boost.su ./Libraries/dsp-c-filters-master/src/so_parametric_cq_cut.d ./Libraries/dsp-c-filters-master/src/so_parametric_cq_cut.o ./Libraries/dsp-c-filters-master/src/so_parametric_cq_cut.su ./Libraries/dsp-c-filters-master/src/so_parametric_ncq.d ./Libraries/dsp-c-filters-master/src/so_parametric_ncq.o ./Libraries/dsp-c-filters-master/src/so_parametric_ncq.su

.PHONY: clean-Libraries-2f-dsp-2d-c-2d-filters-2d-master-2f-src

