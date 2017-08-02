#include<iostream>
using namespace std;
#define size 256
#define allsize size*size
int num[10][allsize+10]={0},finish[10][size*2+3]={0};
int main(void){
	int n,m;
	cin>>n>>m;
	int i,j,k,input;
	for(i=0;i<n;i++){
		for(j=0;j<m*m;j++){
			cin>>input;
			num[i][input-1]=j;
		}
	}
	int row,col;
	int count;
	for(i=0;i<m*m;i++){
		count=0;
		cin>>input;
		input--;
		cout<<"ANS:";
		for(j=0;j<n;j++){
			row=num[j][input]/m;
			col=num[j][input]%m;
			finish[j][row]++;
			finish[j][m+col]++;
			if(row==col)
				finish[j][2*m]++;
			if(row+col==m-1)
				finish[j][2*m+1]++;
			if(finish[j][row]==m||finish[j][m+col]==m||finish[j][2*m]==m||finish[j][2*m+1]==m){
				cout<<j<<" ";
				count++;
			}
		}
		cout<<endl;
		if(count>0)
			cout<<"input="<<input<<endl;
	}
	return 0;
} 
