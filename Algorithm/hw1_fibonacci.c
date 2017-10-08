#include<stdio.h>
struct sq{
	int a,b,c;
}fib[30],ans;
int main(void){
	int i,j;int pri=29989;
	fib[0].a=0;fib[0].b=1;fib[0].c=1;
	for(i=0;i<30;i++){
		fib[i+1].a=(fib[i].a*fib[i].a+fib[i].b*fib[i].b)%pri;
		fib[i+1].b=(fib[i].a*fib[i].b+fib[i].b*fib[i].c)%pri;
		fib[i+1].c=(fib[i].b*fib[i].b+fib[i].c*fib[i].c)%pri;
	}
	int T,n;
	int e,f,x,y;
	scanf("%d",&T);
	while(T-->0){
		scanf("%d",&n);
		n-=1;
		i=0;x=y=1;
		while(n!=0){
			if(n&1){
				e=x,f=y;
				x=(e*fib[i].a+f*fib[i].b)%pri;
				y=(e*fib[i].b+f*fib[i].c)%pri;
			}
			n/=2;
			i++;
		}
		printf("%d\n",x);
	}
	return 0;
} 
