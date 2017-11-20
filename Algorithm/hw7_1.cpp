#include<bits/stdc++.h>
using namespace std;
int main(void){
	int T;
	scanf("%d",&T);
	while(T-->0){
		int n,m,count=0,tic=0,i;
		char str[1003];
		scanf("%d%d",&n,&m);
		scanf("%s",str);
		for(i=0;i<n;i++){
			tic=tic*10+(int)str[i]-'0';
			tic%=m;
			if(tic==0){
				tic=0;count++;
			}
		}
		printf("%d\n",count);
	}
}
