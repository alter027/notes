#include <iostream>
#include <stdio.h>
#include <math.h>
using namespace std;

struct cache_content{
	bool v;
	unsigned int tag;
    // unsigned int	data[16];
    int old ;
 };
const int K = 1024;
double log2(double n){
    // log(n) / log(2) is log2.
    return log(n) / log(double(2));
 }
void simulate(int cache_size, int block_size,int way){
	unsigned int tag, index, x;

	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);
	int tline = (way+1)*(line+1);

	int miss=0,total=0;

	cache_content *cache = new cache_content[tline];
 	// cout << "cache line: " << line <<" ";
 	// cout << "cache_size = " << cache_size << " ";
	// cout << "way:"<<way<<" ";
	for(int j = 0; j < tline; j++){
		cache[j].old = 0;
		cache[j].v = false;
	}
	
    FILE *fp = fopen("LU.txt", "r");  // read file
	
	while(fscanf(fp, "%x", &x) != EOF){
 //		cout << hex << x << " ";
		total++;
		index = (x >> offset_bit) & (line - 1);
		index = index/way;
		tag = x >> (index_bit + offset_bit);
		int ireplace=0;
		int hit=0;
		bool emp=0;
		for(int i=0;i<way;i++){
			if(cache[index*way+i].v && cache[index*way+i].tag == tag){
				ireplace=index*way+i;    // hit
				hit=1;
				break;
			}
		}
		if(hit==0){//miss
			miss++;
			for(int i=0;i<way;i++){
				//if valid = 0;
                if(cache[index*way+i].v == true){
					ireplace = index*way+i;
					cache[ireplace].v = true;
					emp = 1;
					break;
                }
			}
		
		 //if can't find empty one, find the youngest one
            if(!emp){
                int young = 1000000;
                for(int i = 0; i < way; i++){
                    if(cache[index*way+i].old < young){
                        young = cache[index*way+i].old;
                        //cache[index*way+i].v = true;
                        ireplace = index*way+i;
                    }
                }
            }
        }
        // replace
		cache[ireplace].v = true;
		cache[ireplace].old = total;
		cache[ireplace].tag = tag;
		
	}
	// double total = miss+hit;
	//printf("miss = %6lf, hit = %6lf\n",(double)miss/total,(double)hit/total);
	// double miss_num=miss,hit_num=hit;
	//cout << cache_size << "-byte cache " << block_size << "-byte block: " << miss_num/(miss_num+hit_num)*100 << "%" << endl; 
	// printf("%d %lf\n",block_size,miss_num/total);// block_size：x軸,y軸
	cout<<((double)miss/total)*100<<endl;
	fclose(fp);

	delete [] cache;
 }	
int main(){
	int i,j;
	int K=1024;
	int miss,hit;
	// Let us simulate 4KB cache with 16B blocks
	simulate(1*K, 64,1);
	simulate(1*K, 64,2);
	simulate(1*K, 64,4);
	simulate(1*K, 64,8);
	simulate(2*K, 64,1);
	simulate(2*K, 64,2);
	simulate(2*K, 64,4);
	simulate(2*K, 64,8);
	simulate(4*K, 64,1);
	simulate(4*K, 64,2);
	simulate(4*K, 64,4);
	simulate(4*K, 64,8);
	simulate(8*K, 64,1);
	simulate(8*K, 64,2);
	simulate(8*K, 64,4);
	simulate(8*K, 64,8);
	simulate(16*K, 64,1);
	simulate(16*K, 64,2);
	simulate(16*K, 64,4);
	simulate(16*K, 64,8);
	simulate(32*K, 64,1);
	simulate(32*K, 64,2);
	simulate(32*K, 64,4);
	simulate(32*K, 64,8);


	
	return 0;
 }
 