/*
 * svm.c
 *
 *  Created on: Sep.04, 2022
 *     Author: Dezhan Tu
 *     Version: 1.0
 */

#include "svm.h"


/**
 * RBF Kernel Function
 * measure the similarity of two vector in L2 distance
 */
float rbfKernel(float *x1, float *x2, int size, float gamma)
{
	float acc=0, tmp;
	for(int i=0; i<size; i++){
		tmp = x1[i] - x2[i];
		acc += tmp * tmp;
	}
	return expf(-gamma * acc);
}


/**
 * SVM Prediction based on OVO
 */



int svmPredict(float *x, svm_model *model)
{

	int i, res;
	int n_class = model->n_class;
	int total_n_sv = model->total_n_sv;  										/* total #SV */

	float kvalue[total_n_sv];

	for(int i = 0; i < total_n_sv; i++) {
		kvalue[i] = 0.0;
	}
	for(i=0; i<total_n_sv;i++)
		kvalue[i] = rbfKernel(x, model->SV[i], model->n_feature, model->gamma);

	float intrcpt[66];
	for(i = 0; i < 66;i++)
		intrcpt[i] = model->intercept[i];
	/*************Write your code start***************/

	// implement more code for multi-class SVM Prediction
		int start[n_class];
		for(int i = 0; i < n_class; i++) {
			start[i] = 0;
		}

		for(int i = 1; i < n_class; i++) {
			start[i] = start[i - 1] + model->n_sv[i - 1];

		}

		int p = 0;
		int vote[n_class];
		for(int i = 0; i < n_class; i++) {
			vote[i] = 0;
		}
		for(int i = 0; i < n_class; i++) {
			float acc_val[n_class - 1 - i];
			for(int lo = 0; lo < n_class - 1 - i; lo++) {
				acc_val[lo] = 0.0;
			}
			for(int j = i + 1; j < n_class; j++) {
				float acc = 0.0;
				int si = start[i];
				int sj = start[j];
				int ci = model->n_sv[i];
				int cj = model->n_sv[j];
				float* coef1 = model->dual_coef[j - 1];
				float* coef2 = model->dual_coef[i];
				int ngt= 0;
				int ptv = 0;
				float t_c= 0.0;
//				if(i == 5 && j == n_class - 1) {
//					printf("coef1\n");
//					HAL_Delay(1);
//				}

				for (int k = 0; k < ci; k++) {
					t_c	+= coef1[si+k];
					acc += coef1[si + k] * kvalue[si + k];
//					if(i == 5 && j == n_class - 1) {
//						printf("%.8f\n", acc);
//						HAL_Delay(1);
//					}
				}
//				if(i == 5 && j == n_class - 1) {
//					printf("coef2\n");
//					HAL_Delay(1);
//				}
				for(int k = 0; k < cj; k++) {
					t_c += coef2[sj+k];
					acc += coef2[sj + k] * kvalue[sj + k];
//					if(i == 5 && j == n_class - 1) {
//						printf("%.8f\n", acc);
//						HAL_Delay(1);
//					}
				}
				acc += model->intercept[p];
				t_c += model->intercept[p];
//				if(i == 5 && j == n_class - 1) {
//					printf("intercept[p] \n");
//					printf("value intercept: %.8f\n", model->intercept[p]);
//					printf("%.8f\n",acc);
//					HAL_Delay(1);
//				}
				acc_val[j - i - 1] = acc;
				if(acc > 0.0) {

					vote[i]++;
				} else {

					vote[j]++;
				}
				p++;
			}

		}
	int vote_max_idx = 0;
		for(int i = 0; i < n_class; i++) {
			if(vote[i] > vote[vote_max_idx]) {
				vote_max_idx = i;
			}
		}




	return vote_max_idx;

	/*************Write your code End***************/

}


