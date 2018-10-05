# -*- coding: utf-8 -*-
"""
Created on Mon Jul  9 10:36:12 2018

@author: calee
"""

import numpy as np
import matplotlib.pyplot as plt

def DrawRadar(Key,Value,title):
	cnt = sum(Value)/len(Value)
	for i in range(len(Value)):
		Value[i] /= (cnt/2.5)
	labels = np.array(Key)
	data = np.array(Value)
	angles = np.linspace(0, 2*np.pi, len(Key), endpoint=False)
	data = np.concatenate((data, [data[0]])) # 閉合圓形
	angles = np.concatenate((angles, [angles[0]])) # 閉合圓形

	fig = plt.figure()
	ax = fig.add_subplot(111, polar=True) # 轉換極座標
	ax.plot(angles, data, 'bo-', linewidth=2) # 畫線
	ax.set_thetagrids(angles * 180/np.pi, labels, fontproperties=" Microsoft JhengHei")
	ax.set_title(title)
	ax.set_rlim(0,5) # 標出距離圓心
	plt.show()
def main():
    Key = ['a','b','c','d','e']
    value = [6,8,2,3,9]
    DrawRadar(Key,value,'tri')



if __name__ == "__main__":
    main()