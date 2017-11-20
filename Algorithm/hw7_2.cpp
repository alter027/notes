#include<bits/stdc++.h>
#define num 10004
using namespace std;

struct node{
	int ind,a,b;
	double c;
	bool operator<(const node& b) const{
		return c < b.c; 
	}
};

int main(void){
	priority_queue<node> E;
	int T,i;
	int a[num],b[num],q[num];
	scanf("%d",&T);
	while(T-->0){
		int n;
		long long ans=0,total=0;
		node tok,pic;
		scanf("%d",&n);
		for(i=0;i<n;i++)
			scanf("%d",&a[i]);
		for(i=0;i<n;i++){
			scanf("%d",&b[i]);
			total+=(long long)b[i];
			tok.a=a[i];tok.b=b[i];tok.c=(double)b[i]/a[i];tok.ind=i+1;
			E.push(tok);
		}
		i=0;
		while(!E.empty()){
			pic=E.top();E.pop();
			q[i++]=pic.ind;
			total-=pic.b;
			ans+=(long long)total*pic.a;
		}
		printf("%lld\n",ans);
		for(i=0;i<n;i++)
			printf("%d ",q[i]);
		printf("\n");
	}
}
