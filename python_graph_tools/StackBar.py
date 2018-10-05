# -*- coding: utf-8 -*-
"""
Created on Mon Jul  9 10:36:12 2018

@author: calee
"""
import numpy as np
import matplotlib.pyplot as plt

def DrawStackBar(k1,k2,data):
    plt.figure()
    plt.subplot()
    index = np.arange(data.shape[1])
    for i in range(len(k1)):
    	plt.bar(index,data[i],width=0.7,bottom=np.sum(data[:i],axis=0))
    plt.legend()
    plt.show()
    
def main():
    ans = np.array([[3,6,7,2,10],[5,3,2,2,2]])
    k1 = ['a','b','c','d','e']
    k2 = ['t1','t2']
    DrawStackBar(k1,k2,ans)
    
if __name__ == "__main__":
    main()