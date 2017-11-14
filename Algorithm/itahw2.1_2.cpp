#include<bits/stdc++.h>
using namespace std;
vector<long long>E[1000006];
int n;
long long ans,a[1000006],vis[1000006];
void init(void){
	ans=0;
	int x,y,i;
	long long input;
	scanf("%d",&n);
	for(i=0;i<n;i++)
		scanf("%lld",&a[i]);
	for(i=0;i<n;i++){
		vis[i]=0;
		scanf("%lld",&input);
		a[i]=input-a[i];
	}
	for(i=0;i<n-1;i++){
		scanf("%d%d",&x,&y);
		x--;y--;
		E[x].push_back(y);E[y].push_back(x);
	}
}
long long dfs(int i){
	long long count=0;
	int j;
	vis[i]=1;
	for(j=0;j<E[i].size();j++){
		if(vis[E[i][j]]==0)
			count+=dfs(E[i][j]);
	}
	if(abs(count+a[i])>ans)
		ans=abs(count+a[i]);
	return a[i]+count;
}
int main(void){
	init();
	dfs(0);
	printf("%lld\n",ans);
}
