#include<stdio.h> 
int main(void){
	int arr[10000];
	int i=0;
	while(~scanf("%d",&arr[i])){
		i++;
	}
	int j,k=(i+1)/2,l=i/2;
	for(j=0;j<l;j++){
		printf("%d %d ",arr[j],arr[j+k]);
	}
	if(k!=l){
		printf("%d",arr[l]);
	}
	printf("\n");
	return 0;
}
