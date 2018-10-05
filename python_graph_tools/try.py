# -*- coding: utf-8 -*-
"""
Created on Mon Jul  9 10:35:27 2018

@author: calee
"""

#!/usr/bin/python3
#coding:utf-8
import csv
import numpy as np
import matplotlib.pyplot as plt
def Count(rows,title):
	num = rows[0].index(title)
	tri = {}
	for row in rows:
		try:
			if (row[num] == '') or (row[num] == title):
				pass
			elif row[num] in tri: 
				tri[row[num]] += 1
			else:
				tri[row[num]] = 1
		except:
			pass
	return list(tri.keys()),list(tri.values())
def DoubleCount(rows,t1,t2):
	n1 ,n2 = rows[0].index(t1), rows[0].index(t2)
	tmp ,mic = 0, 0
	tri, dic = {}, {}
	ans = np.array([[0 for x in range(5)] for y in range(30)])
	for row in rows:
		try:
			if (row[n1] == '') or (row[n1] == t1):
				pass
			elif row[n1] not in tri: 
				tri[row[n1]] = tmp
				tmp += 1
			if (row[n2] == '') or (row[n2] == t2):
				pass
			elif row[n2] not in dic: 
				dic[row[n2]] = mic
				mic += 1
			ans[tri[row[n1]]][dic[row[n2]]] += 1
		except:
			pass
	return np.array(tri.keys()),np.array(dic.keys()),ans,tmp,mic
def VennCount(rows,t1,t2):
	n1 ,n2 = rows[0].index(t1), rows[0].index(t2)
	a1, a2, a12, other = 0, 0, 0, 0
	for row in rows:
		try:
			if (row[n1] == 'T'): 
				a1 += 1
			if (row[n2] == 'M'): 
				a2 += 1
			if (row[n1] == 'T') and (row[n2] == 'M'): 
				a12 += 1
			if (row[n1] != 'T') and (row[n2] != 'M'): 
				other += 1
		except:
			pass
	return a1, a2, a12, other
def DrawPie(value,labels,title):
	tmp = 0
	propotion = []
	for i in value:
		tmp += i
	for i in value:
		propotion.append(i/tmp)

	plt.pie(x = propotion, # 繪圖數據
	        labels=labels, # 添加教育水平標籤
	        autopct='%.1f%%', # 設置百分比的格式，這裏保留一位小數
	        pctdistance=0.8,  # 設置百分比標籤與圓心的距離
	        wedgeprops = {'linewidth': 1.5, 'edgecolor':'green'},# 設置餅圖內外邊界的屬性值
	        textprops = {'fontsize':12, 'color':'k'} # 設置文本標籤的屬性值
	        )
	# 刪除x軸和y軸的刻度
	plt.xticks(())
	plt.yticks(())
	plt.title(title)
	plt.show()
def DrawBar(Value, Key, title):
    plt.bar(Key, Value)  # tick_label = Key
    plt.title(title)
    plt.show()
def DrawStackBar(tri,dic,k1,k2,data):
    plt.figure()
    plt.subplot()
    index = np.arange(data.shape[1])
    for i in range(tri):
    	plt.bar(index,data[i],width=0.7,bottom=np.sum(data[:i],axis=0))
    plt.legend()
    plt.show()
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
def DrawVenn(a1,a2,a12,other,t1,t2):
    pass
def main():
	# open csv
    with open('animal.csv', newline='',encoding='UTF-8') as csvfile:
        myfile = csv.reader(csvfile)
        rows = list(myfile)
        # draw Histogram for colour
        Key, Value = Count(rows,'animal_colour')
        DrawBar(Value,Key,'animal_colour')
        # draw pie for sex
        Key, Value = Count(rows,'animal_sex')
        DrawPie(Value,Key,'animal_sex')
        # draw stack Hist for type & colour
        k1, k2, mat, tri, dic = DoubleCount(rows,'animal_colour','animal_kind')
        DrawStackBar(tri,dic,k1,k2,mat)
        # draw Radar for type
        Key, Value = Count(rows,'animal_bodytype')
        DrawRadar(Key,Value,'animal_bodytype')
        # draw wenn for sterilization & bacterin
        a1, a2, a12, other = VennCount(rows,'animal_sterilization','animal_sex')
        DrawVenn(a1,a2,a12,other,'animal_sterilization','animal_sex')



if __name__ == "__main__":
    main()