#include <iostream>
#include <stdio.h>
#include <math.h>
using namespace std;
const int way = 8;

struct cache_content{
	bool v;
	unsigned int tag;
	int last;
    // unsigned int	data[16];
 };
double log2(double n){
    // log(n) / log(2) is log2.
    return log(n) / log(double(2));
 }
int print_ans(FILE *fp,FILE *wr,int m,int n,int p){
	int i,j,k;
	int **a = new int*[m];
	for(int i=0;i<m;i++)
		a[i] = new int[n];

	int **b = new int*[n];
	for(int i=0;i<n;i++)
		b[i] = new int[p];

	int **ans = new int*[m];
	for(int i=0;i<m;i++)
		ans[i] = new int[p];

	for(i=0;i<m;i++)
		for(j=0;j<n;j++)
			fscanf(fp,"%d",&a[i][j]);
	for(i=0;i<n;i++)
		for(j=0;j<p;j++)
			fscanf(fp,"%d",&b[i][j]);
	for(i=0;i<m;i++){
		for(j=0;j<p;j++){
			ans[i][j]=0;
			for(k=0;k<n;k++){
				ans[i][j]+=a[i][k]*b[k][j];
			}
			fprintf(wr,"%d ",ans[i][j]);
		}
		fprintf(wr,"\n");
	}
	fprintf(wr,"%d ",(5+((5+(22*n+2))*p+2))*m+2);
 }
int findcache(unsigned int x,int offset_bit,int index_bit,int line,cache_content **cache,int cnt){

	int flag=0;
	int least=cnt;
	int num,i;
	unsigned int index = (x >> offset_bit) & (line - 1);
	unsigned int tag = x >> (index_bit + offset_bit);
	for(i=0;i<way;i++){
		if(cache[index][i].v && cache[index][i].tag == tag){
			cache[index][i].v = true;
			cache[index][i].last = cnt;  // hit
			flag=1;
			num=i;
			break;
		}
		if(cache[index][i].last<least){
			least=cache[index][i].last;
			num=i;
		}
	}
	if(flag==0){
		cache[index][num].v = true;  // miss
		cache[index][num].tag = tag;
		cache[index][num].last = cnt;
		return 1;
	}
	return 0;
 }
int simulate(char *argv[],FILE *wr,int cache_size, int block_size,int cache_L2,int block_L2,int *miss_num,int *miss_L2,int situ){
	cache_size/=way;
	cache_L2/=way;

	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);

	int offset_L2 = (int)log2(block_L2);
	int index_L2 = (int)log2(cache_L2 / block_L2);
	int lineL2 = cache_L2 >> (offset_L2);

	cache_content **cache = new cache_content*[line];
	for(int i=0;i<line;i++)
		cache[i] = new cache_content[way];
	for(int i = 0; i < line; i++)
		for(int j = 0; j < way; j++){
			cache[i][j].v = false;
			cache[i][j].last=0;
			cache[i][j].tag=0;
		}
	cache_content **cacheL2 = new cache_content*[lineL2];
	if(situ){
		for(int i=0;i<lineL2;i++)
			cacheL2[i] = new cache_content[way];
		for(int i=0;i<lineL2;i++){
			for(int j=0;j<way;j++){
//				printf("%d ",j);
				cacheL2[i][j].v = false;
				cacheL2[i][j].last=0;
				cacheL2[i][j].tag=0;
			}
//			printf("\n");
		}
	}
    FILE *fp = fopen(argv[1], "r");  // read file
	unsigned int l1,l2,l3,x;
	int m,n,p,i,j,k,l;
	fscanf(fp, "%x%x%x%d%d%d", &l1,&l2,&l3,&m,&n,&p);
	if(!situ)
		print_ans(fp,wr,m,n,p);
	fclose(fp);

	int cnt=1,miss=0,missL2=0;

	for(i=0;i<m;i++){
		for(j=0;j<p;j++){
			for(k=0;k<n;k++){
				unsigned int x[4]={l3+(i*p+j)*4,l1+(i*n+k)*4,l2+(k*p+j)*4,l3+(i*p+j)*4};
				for(l=0;l<4;l++){
					if(findcache(x[l],offset_bit,index_bit,line,cache,cnt++)){
						miss++;
						if(situ)
							if(findcache(x[l],offset_L2,index_L2,lineL2,cacheL2,cnt)){
								missL2++;
							}
					}
				}
			}
		}
	}

	*miss_num=miss;
	*miss_L2=missL2;
	delete [] cache;
	delete [] cacheL2;
	return m*n*p*4;
 }	

int main(int argc, char *argv[]){
	int K=1024;
	int miss,missL2,total,ans;
    FILE *wr = fopen(argv[2], "w");
	total=simulate(argv,wr,512,32,1,1,&miss,&missL2,0);
	// printf("miss=%d, cnt=%d, ans=%d\n",miss,total,832*miss+4*total);
	// printf("miss=%d, cnt=%d, ans=%d\n",miss,total,104*miss+4*total);
	fprintf(wr,"%d %d ",832*miss+4*total,104*miss+4*total);
	total=simulate(argv,wr,128,16,4*K,128,&miss,&missL2,1);
	ans=total*3+miss*52+missL2*3584;
	// printf("missL2=%d, miss=%d, cnt=%d, ans=%d\n",missL2,miss,total,ans);
	fprintf(wr,"%d\n",ans);
	fclose(wr);
	return 0;
 }