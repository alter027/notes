#include<bits/stdc++.h>
using namespace std;
const int NUM = 30004;
int anc[NUM],exi[NUM];
int find_anc(int a){
	if(anc[a]==a)
		return a;
	return anc[a]=find_anc(anc[a]);
}
int main(void){
	int i,n,m,max=1;
	int a1,a2,a3;
	scanf("%d%d",&n,&m);
	for(i=0;i<NUM;i++)
		anc[i]=i,exi[i]=1;
	for(i=0;i<m;i++){
		scanf("%d%d",&a1,&a2);
		a1=find_anc(a1);a2=find_anc(a2);
		if(a1==a2)
			continue;
		if(exi[a1]>exi[a2])
			exi[a1]+=exi[a2],anc[a2]=anc[a1];
		else
			exi[a2]+=exi[a1],anc[a1]=anc[a2];
		if(exi[a1]>max)
			max=exi[a1];
		if(exi[a2]>max)
			max=exi[a2];
	}	
	printf("%d\n",max);
	return 0;
}