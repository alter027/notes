#!/usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np

def plotData(plt, data, cache):
	print(data)
	x = [p[0] for p in data]
	y = [p[1] for p in data]
	i = 0
	plt.plot(x, y, '-o',label=str(cache)+'K')
def get_data(mat,cnt):
	mat.append([])
	cache, n = map(int,input().split())
	print(cache,n)
	for i in range(n):
		a,b=input().split()
		print(a)
		mat[cnt].append([float(a),float(b)])
	return cache
def main():
	mat = []
	cnt = 0
	for cache_size in range(4):
		cache = get_data(mat, cnt)
		plotData(plt, mat[cnt], cache)
		cnt += 1
	plt.xlabel('Block size')
	plt.ylabel('miss rate')
	plt.legend()
	plt.show()

if __name__ == "__main__":
    main()

