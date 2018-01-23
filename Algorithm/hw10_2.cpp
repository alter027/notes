#include<bits/stdc++.h>
using namespace std;
int vis[10004];
int n,m,ans,cnt;

vector<vector<int> > E;
vector<vector<int> > F;

int dfs(int k){
	int i;
	if(vis[k]==1)
		return -1;
	vis[k]=1;
	cnt++;
	for(i=0;i<F[k].size();i++)
		if(vis[F[k][i]]==0)
			dfs(F[k][i]);
	return k;
 }
void dfs_lvup(int k){
	if(vis[k]==1)
		return;
	vis[k]=1;
	cnt++;
	int i;
	for(i=0;i<E[k].size();i++)
		dfs_lvup(E[k][i]);
	return;
 }
void init(void){
	int a,b,ori,i;
	scanf("%d%d",&n,&m);
	E.clear();
	E.resize(n,vector<int>());
	F.clear();
	F.resize(n,vector<int>());
	for(i=0;i<m;i++){
		scanf("%d%d",&a,&b);
		a--,b--;
		F[a].push_back(b);
		E[b].push_back(a);
	}
 }
int main(void){
	int T,tmp,ori,i;
	scanf("%d",&T);
	while(T-->0){
		init();
		for(i=0;i<n;i++)
			vis[i]=0;
		cnt=0;
		for(i=0;i<n;i++){
			if(vis[i]==0)
				ori=dfs(i);
		}
		for(i=0;i<n;i++)
			vis[i]=0;
		cnt=0;
		dfs(ori);
		if(cnt==n){
			for(i=0;i<n;i++)
				vis[i]=0;
			cnt=0;
			dfs_lvup(ori);
			printf("%d\n",cnt);
		}
		else
			printf("0\n");
	}
	return 0;
}