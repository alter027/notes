#!/usr/bin/python3
#coding:utf-8
import numpy as np
def main():
	tri, tre = [],["basic","all","center","edge"]
	for i in range(4):
		tri.append(input())

	for i in range(1,4):
		fo = open(tri[i], "r")
		line = np.array([float(x) for x in fo.read().split()])
		fo.close()

		print(tri[i],round(line.mean(),6), round(line.var(),6))
		
		fo = open(tri[0]+"dictate", 'a')
		fo.write(str(round(line.mean(),6)))
		fo.write(" ")
		fo.write(str(round(line.var(),6)))
		fo.write("\n")
		fo.close()

		fo = open(tri[0]+tre[i], 'a')
		fo.write(str(round(line.mean(),6)))
		fo.write(" ")
		fo.write(str(round(line.var(),6)))
		fo.write("\n")
		fo.close()
		


		
    
if __name__ == "__main__":
    main()