#include<bits/stdc++.h>
using namespace std;
vector<int>E[10004];
int arr[10004],vis[10004]={0};
int dfs(int k){
	vis[k]=1;
	int i,max=0,tmp=0;
	for(i=0;i<E[k].size();i++){
		if(vis[E[k][i]]==0){
			tmp=dfs(E[k][i]);
			if(tmp>max)
				max=tmp;
		}
	}
	return max+arr[k];
}
int main(void){
	int i,n,v1,v2;
	scanf("%d",&n);
	for(i=1;i<=n;i++)
		scanf("%d",&arr[i]);
	for(i=0;i<n-1;i++){
		scanf("%d%d",&v1,&v2);
		E[v1].push_back(v2);E[v2].push_back(v1);
	}
	printf("%d\n",dfs(1));
	return 0;
}