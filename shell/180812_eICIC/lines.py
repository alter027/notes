#!/usr/bin/python3
#coding:utf-8
import numpy as np
import charts
def main():
    users, utility, ABS_rate = [], [], []
    a ,b = 1000 ,1001
    for i in range(a,b,100):
        tmp = []
        for j in np.arange(0.1,1,0.1):
            tri = input().split(' ')
            tmp.append(float(tri[3]))
        utility.append(tmp)
    for i in range(a,b,100):
        users.append(i)
    for i in np.arange(0.1,1,0.1):
        ABS_rate.append(i)
    charts.line(ABS_rate,users,*utility)


    
if __name__ == "__main__":
    main()
