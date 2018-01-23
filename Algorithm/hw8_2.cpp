#include<bits/stdc++.h>
using namespace std;
int main(void){
	int T,n;
	int i,j,a,b,n1,n2,n3;
	scanf("%d",&T);
	while(T-->0){
		int arr[2][2050]={0};
		scanf("%d",&n);
		arr[1][0]=1;
		for(i=0;i<n;i++){
			scanf("%d%d%d",&n1,&n2,&n3);
			a=i%2;b=(i+1)%2;
			for(j=0;j<2049;j++){
				if(arr[b][j]){
					arr[a][j+n1-2*(j&n1)]=1;
					arr[a][j+n2-2*(j&n2)]=1;
					arr[a][j+n3-2*(j&n3)]=1;
					arr[b][j]=0;
				}
			}
		}
		for(i=2048;i>0;i--){
			if(arr[a][i])
				break;
		}
		printf("%d\n",i);
	}
	return 0;
}