#include<bits/stdc++.h>
using namespace std;
int main(void){
	int i;
	for(i=0;i<32;i++){
//		printf("alu_top AT%d(.src1(src1[%d]),.src2(src2[%d]),0,0,0,0,0,.result(result[%d]),.cout(cout));\n",i,i,i,i);		
		printf("alu_top A%d (.src1(src1[%d]),.src2(src2[%d]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[%d]),.operation(operation),.result(tesult[%d]),.cout(dout[%d]));\n",i,i,i,i-1,i,i);
	}
	return 0;
}

