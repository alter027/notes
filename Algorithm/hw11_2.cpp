#include<bits/stdc++.h>
using namespace std;
int main(void){
	int T,n,m,na,ma,input,flag;
	int i;
	scanf("%d",&T);
	while(T-->0){
		na=0;ma=0;flag=0;
		scanf("%d%d",&n,&m);
		for(i=0;i<n;i++){
			scanf("%d",&input);
			na+=input;
			if(input>m)
				flag=1;
		}
		for(i=0;i<m;i++){
			scanf("%d",&input);
			ma+=input;
		}
		if(na>ma)
			flag=1;
		if(flag==1)
			printf("No\n");
		else
			printf("Yes\n");
	}
	return 0;
} 
