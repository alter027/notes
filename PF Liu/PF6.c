#include<stdio.h>
#include<string.h>
int main(void){
	char str[130];
	int len,flag=0;
	int i=0;
	while(scanf("%s",str)!=EOF){
		len=strlen(str);
		if(str[len-1]=='.'){
			str[len-1]='\0';
			flag=1;
		}
		if(strcmp(str,"the")==0||strcmp(str,"of")==0||strcmp(str,"and")==0||strcmp(str,"at")==0){
			;			
		}
		else{
			printf("%c",str[0]-32);
		}
		if(flag==1){
			printf(" ");
			flag=0;
		}
	}
	printf("\n");
	return 0;
} 
