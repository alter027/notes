#include<stdio.h>
int main(void){
	int i,j,k,b;
	int str[257];
	char a[1000005];
	scanf("%d",&i);
	while(i-->0){
		for(k=0;k<257;k++)
			str[k]=0;
		scanf("%d",&j);
		scanf("%s",a);
		for(k=0;k<j;k++){
			b=a[k];
			str[b]++;
		}
		int ans=0;
		for(k=0;k<257;k++){
			if(str[k]>ans)
				ans=str[k];
		}
		printf("%d\n",ans);
	}
	return 0;
}
