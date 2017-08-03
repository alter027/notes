#include<stdio.h>
#include<math.h>

int main(void){
	int length,width,height;
	scanf("%d %d %d",&length,&width,&height);
	
	int a,b,c;
	a=length*width;
	b=width*height;
	c=length*height;
	
	printf("the surface area is %d\n",2*(a+b+c));
	printf("the volumn is %d\n",sqrt(a*b*c));
	
	return 0;
}
