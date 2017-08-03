#include <stdio.h>
int a[6]={79,47,29,82,26,22};
int b[6]={30,10, 4, 5, 3, 9};
int gcd(int a,int b){
	while(a!=0&&b!=0){
		if(a>b)
			a-=b;
		else
			b-=a;
	} 
	return a==0?b:a;
}
int value(int type,int width,int height,int length){
	int i;
	for(i=0;i<6;i++){
		if(type==a[i])
			break;
	}
	if(i==6)
		return -1;
	if(width<1||height<1||length<1)
		return -2;
	int ans=gcd(width,height);
	ans=gcd(ans,length);
	ans=ans*ans*ans;
	return b[i]*width*height*length*ans;
}
int main(void){
	int type,width,height,length;
	scanf("%d%d%d%d",&type,&width,&height,&length);
	printf("%d",value(type,width,height,length));
	return 0;
}
