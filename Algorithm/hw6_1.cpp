#include<bits/stdc++.h>
int arr[300][300][2];
using namespace std;
int main(void){
	int n;
	int c1,c2,i,j,input;
	scanf("%d",&n);
	for(i=0;i<n;i++)
		for(j=0;j<n;j++){
			scanf("%d",&input);
			c1=0;c2=0;
			while(input%2==0){
				input/=2;
				c1++;
			}
			while(input%5==0){
				input/=5;
				c2++;
			}
			arr[i][j][0]=c1;
			arr[i][j][1]=c2;
		}
	for(i=1;i<n;i++)
		arr[0][i][0]+=arr[0][i-1][0],arr[0][i][1]+=arr[0][i-1][1];
	for(i=1;i<n;i++){
		arr[i][0][0]+=arr[i-1][0][0];
		arr[i][0][1]+=arr[i-1][0][1];
		for(j=1;j<n;j++){
			arr[i][j][0]+=min(arr[i-1][j][0],arr[i][j-1][0]);
			arr[i][j][1]+=min(arr[i-1][j][1],arr[i][j-1][1]);
		}
	}
	printf("%d\n",min(arr[n-1][n-1][0],arr[n-1][n-1][1]));
	return 0;
}