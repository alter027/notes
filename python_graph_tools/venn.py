# -*- coding: utf-8 -*-
"""
Created on Mon Jul  9 08:22:37 2018

@author: user
"""
import matplotlib.pyplot as plt
from matplotlib_venn import venn2

def DrawVenn(a1,a2,a12):
    venn2(subsets=(a1,a2,a12), set_labels=('A', 'B'))
    plt.figure(figsize=(4, 4))
    plt.show()

def main():
    DrawVenn(3,8,2)
    
if __name__ == "__main__":
    main()