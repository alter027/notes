#include<bits/stdc++.h>
using namespace std;
#define NINF -1023456789
#define INF  1023456789
#define NUM  1005
struct edge{
	int s,e,w;
	bool operator<(const edge& b) const{
        return w > b.w;
    }
 };
vector<edge> E[NUM];
priority_queue<edge> P;
int h[NUM],a[NUM][NUM],vis[NUM];
int n,m,q;
void init(void){
	edge pic;
	int i,j,u,v,w;
	scanf("%d%d%d",&n,&m,&q);
	for(i=0;i<m;i++){
		scanf("%d%d%d",&u,&v,&w);
		u--;v--;
		pic.s=u;pic.e=v;pic.w=w;
		E[u].push_back(pic);
	}
	for(i=0;i<n;i++){
		pic.s=n;pic.e=i;pic.w=0;
		E[n].push_back(pic);
	}
 }
void Bell(void){
	int i,j,k,cnt,flag=1;
	edge tmp;
	for(i=0;i<=n;i++)
		h[i]=0;
	while(flag==1){
		flag=0;
		for(j=0;j<n;j++){
			for(k=0;k<E[j].size();k++){
				tmp=E[j][k];
				if(h[tmp.s]+tmp.w<h[tmp.e]){
					h[tmp.e]=h[tmp.s]+tmp.w;
					flag=1;
				}
			}
		}
	}
	for(i=0;i<n;i++){
		for(j=0;j<E[i].size();j++)
			E[i][j].w+=(h[i]-h[E[i][j].e]);
	}
 }
void Dijk(int k){
	int i,j,cnt=1;edge tmp,pic;
	for(i=0;i<n;i++)
		vis[i]=0,a[k][i]=INF;
	a[k][k]=0;vis[k]=1;
	for(i=0;i<E[k].size();i++)
		P.push(E[k][i]);
	while(cnt<n&&!P.empty()){
		tmp=P.top();P.pop();
		if(vis[tmp.e]==0){
			vis[tmp.e]=1;
			a[k][tmp.e]=tmp.w;
			cnt++;
			for(i=0;i<E[tmp.e].size();i++){
				if(vis[E[tmp.e][i].e]==0){
					pic=E[tmp.e][i];
					pic.w=a[k][pic.s]+E[tmp.e][i].w;
					P.push(pic);
				}
			}
		}
	}
 }
int main(void){
	int i,j,u,v;
	init();
	Bell();//set h && w'
	for(i=0;i<=n;i++){
		Dijk(i);
		for(j=0;j<n;j++){
			if(a[i][j]!=INF)
				a[i][j]+=(h[j]-h[i]);
		}
	 }
	while(q-->0){
		scanf("%d%d",&u,&v);
		u--;v--;
		if(a[u][v]==INF)
			printf("no path\n");
		else
			printf("%d\n",a[u][v]);
	 }
	return 0;
 }