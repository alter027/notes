#include<stdio.h>
int max(int a,int b){
	return a>b?a:b;
}
int main(void){
	int T,cha[27],num[14];
	int git,non,pick,ans,n,i;
	char card[10];
	scanf("%d",&T);
	while(T-->0){
		scanf("%d",&n);
		ans=0;
		for(i=0;i<27;i++)
			cha[i]=0;
		for(i=0;i<14;i++)
			num[i]=0;
		int tans=0;
		while(n-->0){
			scanf("%s",card);
			if(card[0]>=65){
				tans=tans>ans?tans:ans;
				ans=0;
				for(i=0;i<27;i++)
					cha[i]=0;
				for(i=0;i<14;i++)
					num[i]=0;
				continue;
			}
			else if(card[1]<58){
				git=10*(card[0]-48)+(card[1]-48);non=card[2]-65;
			}
			else{
				git=(card[0]-48);non=card[1]-65;
			}
			if(git==8){
				ans++;
				for(i=0;i<27;i++)
					cha[i]=ans;
				for(i=0;i<14;i++)
					num[i]=ans;
			}
			else{
				pick=max(cha[non],num[git])+1;
				cha[non]=num[git]=pick;
				ans=ans>pick?ans:pick;
			}
		}
		tans=tans>ans?tans:ans;
		printf("%d\n",tans);
	}
	return 0;
}
