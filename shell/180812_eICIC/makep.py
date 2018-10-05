#!/usr/bin/python3
#coding:utf-8
import numpy as np
def main():
    a, b = 100, 501
    cnt = 0
    for i in range(a,b,100):
        for j in np.arange(0.1,1,0.1):
            # cnt += 1
            print(i,10,j)
    # print(cnt)
    
if __name__ == "__main__":
    main()