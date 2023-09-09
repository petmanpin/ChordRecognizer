/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file            : usb_host.c
  * @version         : v1.0_Cube
  * @brief           : This file implements the USB Host
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/

#include "usb_host.h"
#include "usbh_core.h"
#include "usbh_msc.h"

/* USER CODE BEGIN Includes */
FATFS USBH_fatfs;
uint8_t wtext[] = ", ";
uint8_t ntext[] = "-";
uint16_t counter=0;
uint32_t i=0;
extern char USBHPath [];  /* USBH logical drive path */

/* USER CODE END Includes */

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* USB Host core handle declaration */
USBH_HandleTypeDef hUsbHostFS;
ApplicationTypeDef Appli_state = APPLICATION_IDLE;

/*
 * -- Insert your variables declaration here --
 */
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/*
 * user callback declaration
 */
static void USBH_UserProcess(USBH_HandleTypeDef *phost, uint8_t id);

/*
 * -- Insert your external function declaration here --
 */
/* USER CODE BEGIN 1 */



void writeFile(char filename[],  uint16_t *vec, int size){

	FIL fp;
	char buff[20];

	if (Appli_state == APPLICATION_READY) {

		if(f_mount(&USBH_fatfs, USBHPath, 1) != FR_OK) {
				 Error_Handler();
		 }

		if (f_open(&fp, filename, FA_CREATE_ALWAYS | FA_WRITE) != FR_OK ) {
			Error_Handler();
		}
		else {
			for(int i=0; i<size; i++){
				// convert uint16 to string
				itoa(vec[i], buff, 10);
				// format write
				f_printf(&fp, "%s\n", buff);

			}

			f_close(&fp);
		}

		if(f_mount(NULL, USBHPath, 0) != FR_OK){
			  Error_Handler();
		}

	}
}







float *read_txt(uint8_t file_name[], int num_line) {

	FIL MyFile;
	uint16_t bytesread;
	char line[10];

	if (Appli_state == APPLICATION_READY) {

			if(f_mount(&USBH_fatfs, USBHPath, 0) != FR_OK){
					 Error_Handler();
			 }

			if (f_open(&MyFile, file_name, FA_READ) != FR_OK ) {
				Error_Handler();
			}
			else
			{
				float *array_out = (float *)malloc(sizeof(float)*num_line);

				for(int i = 0; i < num_line; i++) {
					f_gets(line, sizeof(line), &MyFile);
					array_out[i] = atof(line);
				}

				if (f_close(&MyFile) != FR_OK) {
					Error_Handler();
				}

				if(f_mount(NULL, USBHPath, 0) != FR_OK){
					  Error_Handler();
				}
				return array_out;
			}
	}
}




void loadSVMParams(char filename[], svm_model* model){

	FIL fp;
	char line[1024];
	char *token;

	if (Appli_state == APPLICATION_READY) {

		if(f_mount(&USBH_fatfs, USBHPath, 0) != FR_OK){
				 Error_Handler();
		 }

		if (f_open(&fp, filename, FA_READ) != FR_OK ) {
			Error_Handler();
		}


	    /* Read every line and display it */
	    while (f_gets(line, sizeof(line), &fp)) {

	    	token = strtok(line, " ");

	    	if(strcmp(token, "svm_type") == 0){
	    		// do nothing
	    	}

	    	else if(strcmp(token, "kernel_type") == 0){
	    		// do nothing
	    	}

	    	else if(strcmp(token, "gamma") == 0){
	    		token = strtok(NULL, " ");
	    		model->gamma = strtod(token, NULL);
	    	}

	    	else if(strcmp(token, "n_class") == 0){
	    		token = strtok(NULL, " ");
	    		model->n_class = atoi(token);
	    	}

	    	else if(strcmp(token, "total_n_sv") == 0){
	    		token = strtok(NULL, " ");
	    		model->total_n_sv = atoi(token);
	    	}

	    	else if(strcmp(token, "intercept") == 0){
				int n = model->n_class * (model->n_class - 1)/2;
				model->intercept = (float *)malloc(sizeof(float)*n);
				for(int i=0; i<n; i++){
		    		token = strtok(NULL, " ");
					model->intercept[i] = strtod(token, NULL);
				}
	    	}

	    	else if(strcmp(token, "label") == 0){
	    		int n = model->n_class;
				model->label = (int *)malloc(sizeof(int)*n);
				for(int i=0; i<n; i++){
		    		token = strtok(NULL, " ");
					model->label[i] = atoi(token);
				}
	    	}

	    	else if(strcmp(token, "n_sv") == 0){
				int n = model->n_class;
				model->n_sv = (int *)malloc(sizeof(int)*n);
				for(int i=0;i<n;i++){
		    		token = strtok(NULL, " ");
					model->n_sv[i] = atoi(token);
				}
	    	}

	    	else if(strcmp(token, "n_feature") == 0){
	    		token = strtok(NULL, " ");
	    		model->n_feature = atoi(token);
	    	}
	    	else if(strcmp(token, "scaler_min") == 0){
				int n = model->n_feature;
				model->scaler_min = (float *)malloc(sizeof(float)*n);
				for(int i=0; i<n; i++){
		    		token = strtok(NULL, " ");
					model->scaler_min[i] = strtod(token, NULL);
				}

	    	}
	    	else if(strcmp(token, "scaler_max") == 0){
				int n = model->n_feature;
				model->scaler_max = (float *)malloc(sizeof(float)*n);
				for(int i=0; i<n; i++){
		    		token = strtok(NULL, " ");
					model->scaler_max[i] = strtod(token, NULL);
				}

	    	}

	    	else if(strcmp(token, "SV") == 0){

	    		int total_n_sv = model->total_n_sv;
	    		int n_feature = model->n_feature;

	    		// allocate memory for support vectors, size (total_n_sv, n_feature)
	    		model->SV = malloc(sizeof(float *)*total_n_sv);
	    		for(int i=0; i<total_n_sv; i++){
	    			model->SV[i] = (float *)malloc(sizeof(float)*n_feature);
	    		}

	    		// parse value
	    		for(int i=0; i<total_n_sv; i++){
	    			f_gets(line, sizeof(line), &fp);
	    	    	token = strtok(line, " ");
	    			for(int j=0; j<n_feature; j++){
	    				model->SV[i][j] = strtod(token, NULL);
		    	    	token = strtok(NULL, " ");
	    			}
	    		}
	    	}

	    	else if(strcmp(token, "dual_coef") == 0){

	    		// allocate memory for dual_coef, size (n_class-1, total_n_sv)
	    		int m = model->n_class - 1;
	    		int total_n_sv = model->total_n_sv;
	    		model->dual_coef = malloc(sizeof(float *)*m);
	    		for(int i=0; i<m; i++)
	    			model->dual_coef[i] = (float *)malloc(sizeof(float)*total_n_sv);

	    		// parse values
	    		for(int i=0; i<total_n_sv; i++)
	    		{
	    			f_gets(line, sizeof(line), &fp);
		    		token = strtok(line, " ");
	    			for(int j=0; j<m; j++){
			    		model->dual_coef[j][i] = strtod(token, NULL);
			    		token = strtok(NULL, " ");
	    			}
	    		}

	    	}



	    }

		f_close(&fp);


		if(f_mount(NULL, USBHPath, 0) != FR_OK){
			  Error_Handler();
		}

	}

}




/* USER CODE END 1 */

/**
  * Init USB host library, add supported class and start the library
  * @retval None
  */
void MX_USB_HOST_Init(void)
{
  /* USER CODE BEGIN USB_HOST_Init_PreTreatment */

  /* USER CODE END USB_HOST_Init_PreTreatment */

  /* Init host Library, add supported class and start the library. */
  if (USBH_Init(&hUsbHostFS, USBH_UserProcess, HOST_FS) != USBH_OK)
  {
    Error_Handler();
  }
  if (USBH_RegisterClass(&hUsbHostFS, USBH_MSC_CLASS) != USBH_OK)
  {
    Error_Handler();
  }
  if (USBH_Start(&hUsbHostFS) != USBH_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USB_HOST_Init_PostTreatment */

  /* USER CODE END USB_HOST_Init_PostTreatment */
}

/*
 * Background task
 */
void MX_USB_HOST_Process(void)
{
  /* USB Host Background task */
  USBH_Process(&hUsbHostFS);
}
/*
 * user callback definition
 */
static void USBH_UserProcess  (USBH_HandleTypeDef *phost, uint8_t id)
{
  /* USER CODE BEGIN CALL_BACK_1 */
  switch(id)
  {
  case HOST_USER_SELECT_CONFIGURATION:
  break;

  case HOST_USER_DISCONNECTION:
  Appli_state = APPLICATION_DISCONNECT;
  break;

  case HOST_USER_CLASS_ACTIVE:
  Appli_state = APPLICATION_READY;

  break;

  case HOST_USER_CONNECTION:
  Appli_state = APPLICATION_START;

  break;

  default:
  break;
  }
  /* USER CODE END CALL_BACK_1 */
}

/**
  * @}
  */

/**
  * @}
  */

