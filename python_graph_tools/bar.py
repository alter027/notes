# -*- coding: utf-8 -*-
"""
Created on Mon Jul  9 10:36:11 2018

@author: calee
"""

import matplotlib.pyplot as plt

def DrawBar(Value, Key, title):
    plt.bar(Key, Value)  # tick_label = Key
    plt.title(title)
    plt.show()
    
def main():
    value = [3,6,7,2,10]
    key = ['a','b','c','d','e']
    DrawBar(value,key,'tri')
    
if __name__ == "__main__":
    main()