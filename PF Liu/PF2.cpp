#include<iostream>
#include<cstdio>
using namespace std;
int isroom(int i){
	if(i%400==0)
		return 1;
	if(i%100==0)
		return 0;
	if(i%4==0)
		return 1;
	return 0;
}
int main(void){
	int year,weekday;
	int month[12]={31,28,31,30,31,
				   30,31,31,30,31,30,31};
	int pre_month[12]={31,28,31,30,31,
				   30,31,31,30,31,30,31};
	scanf("%d%d",&year,&weekday);
	if(isroom(year)){
		month[1]=29;
	}
	pre_month[0]=0;
	pre_month[1]=month[0];
	int i;
	for(i=1;i<12;i++)
		pre_month[i]=pre_month[i-1]+month[i-1];
	for(i=0;i<12;i++)
		cout<<pre_month[i]<<" ";
	cout<<endl;
	weekday+=6;
	int mon,day,total;
	int k;
	scanf("%d",&k);
	while(k-->0){
		scanf("%d%d",&mon,&day);
		if(mon>12){
			printf("-1 ");
		}
		else if(day>month[mon-1]){
			printf("-2 ");
		}
		else{
			total=pre_month[mon-1]+day+weekday;
			printf("%d %d %d %d\n",total,pre_month[mon-1],day,weekday);
			printf("%d\n",total%7);
		}
	}
	return 0;
} 
