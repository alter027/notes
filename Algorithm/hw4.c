#include<stdio.h>
#define INF 2013456789
#define PIN 1023456789
#define bim 94878787
#define tsz 200000
int n,k,a[100005],t[200005][2];
long long ans;
void hash(int i){
	int pick=i;
	if(pick>PIN)
		pick=(i-PIN)%bim%tsz;
	else if(pick<=-1*PIN)
		pick=(i+INF)%bim%tsz;
	else
		pick=(i+PIN)%bim%tsz;
	while(t[pick][0]!=INF&&t[pick][0]!=i){
		pick++;
		if(pick>=tsz)
			pick-=tsz;
	}
	if(t[pick][1])
		t[pick][1]++;
	else
		t[pick][0]=i,t[pick][1]=1;
}
int find_hash(int i){
	int fp,pick=i;
	if(pick>PIN)
		pick=(i-PIN)%bim%tsz;
	else if(pick<=-1*PIN)
		pick=(i+INF)%bim%tsz;
	else
		pick=(i+PIN)%bim%tsz;
	while(t[pick][0]!=INF&&t[pick][0]!=i){
		pick++;
		if(pick>=tsz)
			pick-=tsz;
	}
	if(t[pick][0]==INF)
		return -1;
	return pick;
}
int solve(void){
	int i,p,q;
	for(i=0;i<n;i++)
		hash(a[i]);
	for(i=0;i<n;i++){
		if(a[i]!=k-a[i]){
			p=find_hash(a[i]);
			q=find_hash(k-a[i]);
			if(p==-1||q==-1)
				continue;
			ans+=(long long)t[p][1]*(long long)t[q][1];
//			printf("i=%d,k-i=%d,ans=%lld",t[p][1],t[q][1],ans);
			t[p][1]=0;  t[q][1]=0;
		}
		else if(a[i]*2==k){
			p=find_hash(a[i]);
			if(p==-1)
				continue;
			ans+=(long long)t[p][1]*(long long)(t[p][1]-1)/2;
//			printf("i=%d,k-i=%d,ans=%lld",t[p][1],t[q][1],ans);
			t[p][1]=0;  
		}
	}
	printf("%lld\n",ans);
	return 0;
}
int main(void){
	int T,i,input;
	scanf("%d",&T);
	while(T-->0){
		scanf("%d%d",&n,&k);
		for(i=0;i<n;i++)
			scanf("%d",&a[i]);
		for(i=0;i<tsz;i++){
			t[i][0]=INF;t[i][1]=0;
		}
		ans=0;
		solve();
	}
	return 0;
}
