#!/usr/bin/python3
#coding:utf-8
import numpy as np
import matplotlib.pyplot as plt

def main():
    b = []
    for i in range(9):
        a = [x for x in input().split()]
        b.append(a[3])
    print(*b)
    
if __name__ == "__main__":
    main()
