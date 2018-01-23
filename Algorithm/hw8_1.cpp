#include<bits/stdc++.h>
using namespace std;
struct node{
	node *left,*right;
	int num;
 };
void find(int num,node *pic){
	if(num>pic->num){
		if(pic->right==NULL){
			node *newn=new node;
			newn->num=num,newn->right=NULL,newn->left=NULL;
			pic->right=newn;
		}
		else
			find(num,pic->right);
	}
	else{
		if(pic->left==NULL){
			node *newn=new node;
			newn->num=num,newn->right=NULL,newn->left=NULL;
			pic->left=newn;
		}
		else
			find(num,pic->left);
	}
 }
void get(int num,node *pic){
 //	printf("%d ",pic->num);
	if(num==pic->num);
	else if(num>pic->num){
		printf("R");
		if(pic->right!=NULL)
			get(num,pic->right);
	}
	else{
		printf("L");
		if(pic->left!=NULL)
			get(num,pic->left);
	}	
 }
int main(void){
	int n,m,input;
	while(scanf("%d%d",&n,&m)==2){
		node *root=new node;
		scanf("%d",&root->num);
		root->left=NULL;root->right=NULL;
		int i;
		for(i=1;i<n;i++){
			scanf("%d",&input);
			find(input,root);
		}
		get(m,root);
		printf("\n");
	}
	return 0;
 }