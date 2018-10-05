#coding=utf-8  
from matplotlib import pyplot as plt  

X = []
x, y = [], []

# print("ABS/subframe\n")
for i in range(25):
	tmp = input()
	# print(tmp)
	a, b = map(float,tmp.split())
	x.append((a,b))
	if (i+1)%5 == 0:
		for j,k in x:
# 			print('%.6f' %j,'(%.6f)' %k,end=" ")
 			print('%.6f' %j,end=" ")
		print("\n")
		x, y = [], []
'''
fig = plt.figure()

plt.ylabel('subframe ratio')
plt.xlabel('ABS ratio')
# ax = fig.add_subplot(233)
# im = ax.imshow(X, cmap=plt.cm.summer) #春
im = plt.imshow(X, cmap=plt.cm.bone)
plt.colorbar(im)
plt.show()
'''
