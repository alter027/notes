#!/usr/bin/python3
#coding:utf-8
import numpy as np
import matplotlib.pyplot as plt

def main():
    cnt = 20000
    n = 10
    percentage, utility = [], []
    p = []
    c1, c2 = 0, 0
    for i in range(0,n):
        a = [float(x) for x in input().split()]
        a.sort()
        p.append(a)
        # print(a)
    print(len(p[0]))
    print(len(p))
    # utility.sort()
    # print(utility)

    # print(percentage,x,utility)
    labels = []
    plt.subplot() # 創建小圖(分層圖)
    plt.ylabel('user_ratio')
    plt.xlabel('utility')
    plt.title('Center users, 1000 user for 0.3 subframe in every map')
    for i in range(n):
        k = [j/len(p[i]) for j in np.arange(1,len(p[i])+1)]
        if i%2 is 0:
            plt.plot(k,p[i])
            labels.append(str(i/10))
    plt.legend(labels,title='ABS_ratio')
    plt.show()
    # plt.savefig('edge_1000u7a.png')
    
if __name__ == "__main__":
    main()
