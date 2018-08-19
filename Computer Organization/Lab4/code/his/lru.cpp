#include <iostream>
#include <stdio.h>
#include <math.h>
using namespace std;

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
void simulate(int cache_size, int block_size,int way){
	unsigned int tag, index, x;

	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);

	int miss=0,hit=0;
	cache_content **cache = new cache_content*[line];
	for(int i=0;i<line;i++)
		cache[i] = new cache_content[way];
 //	cout << "cache_size = " << cache_size << "," << " block_size = " << block_size <<" ";
 //	cout << "cache line: " << line << endl;

	for(int i = 0; i < line; i++)
		for(int j = 0; j < way; j++){
			cache[i][j].v = false;
			cache[i][j].last=0;
		}
	
    FILE *fp = fopen("RADIX.txt", "r");  // read file
	int flag;int cnt=0;int num,least;

	while(fscanf(fp, "%x", &x) != EOF){
 //		cout << hex << x << " ";
		flag=0;least=cnt;
		index = (x >> offset_bit) & (line - 1);
		tag = x >> (index_bit + offset_bit);
		for(int i=0;i<way;i++){
			if(cache[index][i].v && cache[index][i].tag == tag){
				cache[index][i].v = true;
				cache[index][i].last = cnt;  // hit
				hit++; flag=1;
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
			miss++;
		}
		cnt++;
	}
	double total = miss+hit;
	double miss_num=miss,hit_num=hit;
	//printf("miss = %6lf, hit = %6lf\n",(double)miss/total,(double)hit/total);
	//cout << cache_size << "-byte cache " << block_size << "-byte block: " << miss_num/(miss_num+hit_num)*100 << "%" << endl; 
	printf("%d %lf\n",way,miss_num/total);
	fclose(fp);

	delete [] cache;
 }	
int main(){
	int i,j;
	int K=1024;
	int miss,hit;
	// Let us simulate 4KB cache with 16B blocks
	for(i=1;i<=32;i*=2){
		printf("%d %d\n",i,4);
		for(j=1;j<=8;j*=2){
			simulate(i*K, 64, j);
		}
	}
	return 0;
 }
 