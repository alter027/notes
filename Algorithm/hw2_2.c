#include<stdio.h>
int flag;
int Partition(int *a,int p,int r){
	int i=p,j,tmp;
	for(j=p;j<r;j++){
		flag++;
		if(a[j]<=a[r]){
			tmp=a[i];a[i]=a[j];a[j]=tmp;i++;
		}
	}
	tmp=a[i];a[i]=a[r];a[r]=tmp;
	return i;
}
void Quicksort(int *a,int p,int r){
	if(p>=r)
		return;
	int q=Partition(a,p,r);
	Quicksort(a,p,q-1);
	Quicksort(a,q+1,r);
}
int main(void){
	int T,n,arr[1050],i;
	scanf("%d",&T);
	while(T-->0){
		scanf("%d",&n);
		for(i=0;i<n;i++){
			scanf("%d",&arr[i]);
		}
		flag=0;
		Quicksort(arr,0,n-1);
		if(flag>=(n*(n-1))/2)
			printf("Yes\n");
		else
			printf("No\n");
		for(i=0;i<n;i++)
			printf("%d ",arr[i]);
		printf("\n");
	}
	return 0;
}
