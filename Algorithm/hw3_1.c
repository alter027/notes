#include<stdio.h>
long long p[2][3];
long long f(long long i,long long n){
	n-=1;
	return p[i][0]*n*n+p[i][1]*n+p[i][2];
}
int main(void){
	long long i,j,n,x,y;
	long long low,high,pick;
	long long a,b,a1,b1;
	int T;
	scanf("%d",&T);
	while(T-->0){
		long long ans=0;
		for(i=0;i<2;i++)
			for(j=0;j<3;j++)
				scanf("%lld",&p[i][j]);
		scanf("%lld",&n);
		low=1;high=n+1;pick=(low+high)/2;
		do{
			x=pick;y=n-pick;
			a=f(0,x);a1=f(0,x+1);
			b=f(1,y);b1=f(1,y+1);
			if(a==b){
				ans=a;
				break;
			}
			if(high==1||low==n)
				break;
			if(a<b){
				low=x;pick=(low+high)/2;
			}
			else{
				high=x;pick=(low+high)/2;
			}
		}while(!((a<=b&&b<=a1)||(b<=a&&a<=b1)));
		if(a<=b&&b<=a1)
			ans=b;
		else if(b<=a&&a<=b1)
			ans=a;
		else if(high==1||low==n){
			a=f(0,n);b=f(1,n);
			ans=a<b?a:b;
		}
		printf("%lld\n",ans);
	}
	return 0;
}
