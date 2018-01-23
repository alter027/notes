#include<bits/stdc++.h>
using namespace std;
#define NUM 100005
struct node{
	int s,e,num;
	int w;
	bool operator<(const node& b) const
    {
        return w > b.w;
    }
 };
int rea[NUM],edg[NUM],vis[NUM];
int n,m;
vector<node> K[NUM];
void init(void){
	node pic;
	int i;
	int a,b,w;
	for(i=0;i<NUM;i++)
		rea[i]=0,edg[i]=0,vis[i]=0;
	scanf("%d%d",&n,&m);
	for(i=0;i<m;i++){
		scanf("%d%d%d",&a,&b,&w);
		a--;b--;
		pic.s=a;
		pic.e=b;
		pic.w=w;
		pic.num=i;
		K[a].push_back(pic);
		pic.s=b;
		pic.e=a;
		K[b].push_back(pic);
	}
 }
void solve(void){
	priority_queue<node> E;
	node pic,tok;
	int i,j;
	int cnt=0,large;
	for(i=0;i<K[0].size();i++)
		E.push(K[0][i]);
	vis[0]=1;
	while(!E.empty()){
		pic=E.top();E.pop();
		if(cnt==n-1&&large<pic.w)
			break;
		if(vis[pic.e]==0){
			vis[pic.e]=1;
			j=pic.e;
			for(i=0;i<K[j].size();i++){
				if(vis[K[j][i].e]==0)
					E.push(K[j][i]);
			}
			rea[pic.e]=pic.w;
			large=(pic.w>large)?pic.w:large;
			edg[pic.num]=1;
			cnt++;
		}
		else{
			if(rea[pic.e]==pic.w)
				edg[pic.num]++;
		}
	}
 }
int main(void){
	init();
	solve();
	int i;
	for(i=0;i<m;i++){
		if(edg[i]==1)
			printf("any\n");
		else if(edg[i]==0)
			printf("none\n");
		else
			printf("at least one\n");
	}
	return 0;
}
