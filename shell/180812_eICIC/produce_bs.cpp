#include<bits/stdc++.h>
using namespace std;
int main(void){
	int length,width;
	double BS_ratio,ABS_ratio;
	scanf("%d %d %lf %lf",&length,&width,&BS_ratio,&ABS_ratio);
	int Simulation_area=length*width;
	int BS=Simulation_area*BS_ratio;
	int ABS=BS*ABS_ratio;
    map<int,int>M;
    map<int,int>::iterator iter;
    M.clear();
    srandom(time(NULL));
    int tmp=random()%Simulation_area;
    iter=M.find(tmp);
    M[tmp]=0;
    for(int i=0;i<BS;i++){
        while(iter!=M.end()){
            tmp=random()%Simulation_area;
            iter=M.find(tmp);
        }
        M[tmp]=i;
        iter=M.find(tmp);
        int x=tmp%length,y=tmp/length;
        printf("%d %d ",x,y);
        ABS--;
        if(ABS>0)
        	printf("1\n");
        else
        	printf("0\n");
    }
 }