#include<bits/stdc++.h>
using namespace std;
int main(void){
	int T,n,m,na,ma,input,flag;
	int i,j,tmp,a[100];
	scanf("%d",&T);
	while(T-->0){
		priority_queue<int> E;
		priority_queue<int> F;
		na=0;ma=0;flag=0;
		scanf("%d%d",&n,&m);
		for(i=0;i<n;i++)
			scanf("%d",&a[i]);
		for(i=0;i<m;i++){
			scanf("%d",&input);
			E.push(input);
		}
		for(i=0;i<n;i++){
			for(j=0;j<a[i];j++){
				if(E.empty()){
					flag=1;break;
				}
				F.push(E.top());E.pop();
			}
			if(flag==1)
				break;
			for(j=0;j<a[i];j++){
				tmp=F.top()-1;F.pop();
				if(tmp!=0)
					E.push(tmp);
			}
		}
		if(flag==1)
			printf("No\n");
		else
			printf("Yes\n");
	}
	return 0;
} 
