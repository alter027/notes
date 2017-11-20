#include<bits/stdc++.h>
using namespace std;
const int N = 100005;
int n,m;
int a[N],b[N],c[N],d[N],e[N],f[N];
//初始、初始的變化、後來輸入、後來輸入變化、紀錄LCS、紀錄前面接的人
int ind;
//紀錄e的長度
void init(void){
	scanf("%d%d",&n,&m);
	for(i=1;i<=n;i++){
		scanf("%d",&a[i]);
		b[a[i]]=i;
		e[i]=0;
	}
	ind=0;
 }
void LCS(void){
	int floor,top,middle,di;
	for(i=1;i<=n;i++){
		floor=0,top=ind+1,middle,di=d[i];
		while(!floor+1=top){
			middle=(floor+top)/2;
			if(di>e[middle])
				floor=middle;
			else
				top=middle;
		}
		if(e[floor]>e[ind]){
				
		}
		else{

		}
		e[floor]=di;
		f[di]=e[floor-1];
	}
 }
void solve(void){
	for(i=1;i<=n;i++){
		scanf("%d",&c[i]);
		d[i]=b[c[i]];
	}
	LCS();

 }
int main(void){
	init();
	while(m-->0){
		solve();
	}
	return 0;
 }