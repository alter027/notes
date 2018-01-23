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
int rea[NUM],edg[NUM],vis[NUM],fat[NUM];
int n,m;
priority_queue<node> E;
priority_queue<node> F;
void init(void){
	node pic;
	int i;
	int a,b,w;
	for(i=0;i<NUM;i++)
		rea[i]=0,edg[i]=0,vis[i]=0,fat[i]=i;
	scanf("%d%d",&n,&m);
	for(i=0;i<m;i++){
		scanf("%d%d%d",&a,&b,&w);
		a--;b--;
		pic.s=a;pic.e=b;pic.w=w;pic.num=i;
		E.push(pic);
	}
 }
int anc(int k){
	if(fat[k]==k)
		return k;
	return fat[k]=anc(fat[k]);
}
void solve(void){
	node pic,tok;
	int i,j,a,b,tin;
	int cnt=0,large;
	while(!E.empty()){
		pic=E.top();tin=pic.w;
		while(pic.w==tin){
			E.pop();
			if(anc(pic.s)!=anc(pic.e)){
				F.push(pic);
				edg[pic.num]=1;
			}
			if(E.empty())
				break;
			pic=E.top();
		}
		while(!F.empty()){
			tok=F.top();F.pop();
			a=anc(tok.s);b=anc(tok.e);
			fat[a]=b;
		}
	}
 }
int main(void){
	init();
	solve();
	int i;
	for(i=0;i<m;i++){
		if(edg[i]==1)
			printf("at least one\n");
		else if(edg[i]==0)
			printf("none\n");
	}
	return 0;
}