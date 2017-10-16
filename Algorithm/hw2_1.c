#include<stdio.h>
int arr[100050];
void maxHeapify(int *a,int num,int i){
	int l=2*i,r=2*i+1,tmp;
	int largest=i;
	if(l<=num&&a[l]>a[i])
		largest=l;
	if(r<=num&&a[r]>a[largest])
		largest=r;
	if(largest!=i){
		tmp=a[i];a[i]=a[largest];a[largest]=tmp;
		maxHeapify(a,num,largest);
	}
}
void buildMaxHeap(int *a,int num){
	int i;
	for(i=num/2;i>=1;i--)
		maxHeapify(a,num,i);
}
HeapSort(int *a,int num){
	buildMaxHeap(a,num);
	int i,tmp;
	for(i=1;i<num;i++)
		printf("%d ",arr[i]);
	printf("%d\n",arr[num]);
	for(i=num;i>=2;i--){
		tmp=a[1];a[1]=a[i];a[i]=tmp;
		maxHeapify(a,i-1,1);
	}
}
int main(void){
	int num,i;
	scanf("%d",&num);
	for(i=1;i<=num;i++)
		scanf("%d",&arr[i]);
	HeapSort(arr,num);
	for(i=1;i<num;i++)
		printf("%d ",arr[i]);
	printf("%d\n",arr[num]);
	return 0;
} 
