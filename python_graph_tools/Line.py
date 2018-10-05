# -*- coding: utf-8 -*-
"""
Created on Mon Jul  9 11:36:14 2018

@author: calee
"""

import matplotlib.pyplot as plt
def plotData(plt, data):
    x = [p[0] for p in data]
    y = [p[1] for p in data]
    plt.plot(x, y, '-o')

def main():
    data = [[(1,2), (3,4), (5,2), (7,4), (9,8)],[(1,1), (3,6), (5,9), (7,1), (9,3)]]
    for i in range(len(data)):
        plotData(plt,data[i])
    plt.show()
    
if __name__ == "__main__":
    main()