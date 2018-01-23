#include<bits/stdc++.h>
using namespace std;

double n=15;
double b0,b1,ux,uy,tx,ty,txy,vx,vy;
double SSE,o2,SXX,SXY,SYY;
double seb0,seb1;
double x[20]={
	3.1,4.5,3.4,2.5,2.2,
	1.2,5.3,4.8,2.4,3.5,
	1.3,3.0,3.3,3.2,1.8
 };
double y[20]={
	33.0,31.0,34.9,35.6,36.1,
	39.0,30.1,31.2,35.7,31.9,
	37.3,33.8,32.8,31.6,37.7
 };

void init(void){
	b0=0,b1=0,ux=0,uy=0,tx=0,ty=0,txy=0,vx=0,vy=0;
	int i=0;
	for(i=0;i<n;i++){
		tx+=x[i],ty+=y[i];
		txy+=x[i]*y[i];
		vx+=x[i]*x[i],vy+=y[i]*y[i];
	}
	ux=tx/n;
	uy=ty/n;
 }
void SXX_SXY(void){
	int i;
	SXX=0;SXY=0;SYY=0;
	for(i=0;i<n;i++){
		SXX+=(x[i]-ux)*(x[i]-ux);
		SXY+=(x[i]-ux)*(y[i]-uy);
		SYY+=(y[i]-uy)*(y[i]-uy);
	}
 }
void Estimated_regression_line(void){
	b1=(txy-(tx*ty)/n)/(vx-(tx*tx)/n);
	b0=uy-b1*ux;
	printf("b0 = %lf, b1 = %lf\n",b0,b1);
 }
void Computed_residuals(int i){
	if(i%5==0)
		printf("\n");
	double tmp=b0+b1*x[i];
	printf("%lf ",y[i]-tmp);
 }
void Computed_SSE_variance(void){
	int i;
	SSE=0;
	for(i=0;i<n;i++)
		SSE+=(y[i]-(b0+b1*x[i]))*(y[i]-(b0+b1*x[i]));
	printf("\nSSE = %lf\n",SSE);
 }
void Find_standard_error(void){
	double e0=0,e1=0;
	o2=SSE/(n-2);
	printf("Standard error for b0 = %lf, for b1 = %lf\n",e0,e1);
 }

void atof(void){
	int i;
	init();
	SXX_SXY();
	Estimated_regression_line();
	for(i=0;i<n;i++)
		Computed_residuals(i);
	printf("\n");
	Computed_SSE_variance();
	o2=SSE/(n-2);
	seb0=sqrt(o2*o2*(1/n+(ux*ux)/SXX));
	seb1=sqrt(o2*o2*(1/SXX));
 }

int main(void){

	atof();

	printf("SXY/SXX = %lf\n",SXY/SXX);
	printf("SSE/(n-2) = %lf\n",o2);
	printf("seb0 = %lf\n",seb0);
	printf("seb1 = %lf\n",seb1);
	printf("R^2 = %lf\n",1-(SSE/SYY));
	printf("b1/seb1 = %lf\n",b1/seb1);
	printf("b0/seb0 = %lf\n",b0/seb0);
	for(int i=0;i<n;i++){
		Computed_residuals(i);
		printf("\n");
	}
	printf("uyx0 = %lf\n",())

	return 0;
 }