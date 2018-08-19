#include <iostream>
#include <stdio.h>
#include <math.h>
using namespace std;

struct cache_content{
	bool v;
	unsigned int tag;
    // unsigned int	data[16];
 };
//const int K = 1024;
double log2(double n){
    // log(n) / log(2) is log2.
    return log(n) / log(double(2));
 }
void simulate(int cache_size, int block_size){
	unsigned int tag, index, x;

	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);

	int miss=0,hit=0;

	cache_content *cache = new cache_content[line];
 //	cout << "cache_size = " << cache_size << "," << " block_size = " << block_size <<" ";
 //	cout << "cache line: " << line << endl;

	for(int j = 0; j < line; j++)
		cache[j].v = false;
	
    FILE *fp = fopen("ICACHE.txt", "r");  // read file
	
	while(fscanf(fp, "%x", &x) != EOF)
    {
 //		cout << hex << x << " ";
		index = (x >> offset_bit) & (line - 1);
		tag = x >> (index_bit + offset_bit);
		if(cache[index].v && cache[index].tag == tag){
			cache[index].v = true;    // hit
			hit++;
		}
		else
        {
			cache[index].v = true;  // miss
			cache[index].tag = tag;
			miss++;
		}
	}
	double total = miss+hit;
	//printf("miss = %6lf, hit = %6lf\n",(double)miss/total,(double)hit/total);
	double miss_num=miss,hit_num=hit;
	//cout << cache_size << "-byte cache " << block_size << "-byte block: " << miss_num/(miss_num+hit_num)*100 << "%" << endl; 
	printf("%d %lf\n",block_size,miss_num/total);
	fclose(fp);

	delete [] cache;
 }	
int main(){
	int i,j;
	int K=1024;
	int miss,hit;
	// Let us simulate 4KB cache with 16B blocks
	for(i=4;i<=256;i*=4){
		printf("%d %d\n",i,5);
		for(j=16;j<=256;j*=2)
			simulate(i*K, j);
	}
	return 0;
 }
 