#include<bits/stdc++.h>
int arr[1000];
int ans;
void search(int input){
	int i;
	int down=-1,up=ans;
	int mid=(down+up)/2;
	while(mid!=-1&&mid!=ans-1&&up-down>1){
		if(input>=arr[mid]){
			down=mid;
		}
		else
			up=mid;
		mid=(down+up)/2;
	}
	if(ans==0)
		arr[ans++]=input;
	else if(input>=arr[ans-1])
		arr[ans++]=input;
	else if(input>=arr[mid])
		arr[mid+1]=input;
	else
		arr[mid]=input;
/*	for(i=0;i<ans;i++)
		printf("%d ",arr[i]);
	printf("\n");*/
}
int main(void){
	int T,input,n,i;
	scanf("%d",&T);
	while(T-->0){
		ans=0;
		scanf("%d",&n);
		for(i=0;i<n;i++){
			scanf("%d",&input);
			search(input);
		}
		printf("%d\n",ans);
	}
	return 0;
}