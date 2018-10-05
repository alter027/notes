#coding=utf-8  
from matplotlib import pyplot as plt  

X = []
for i in range(10):
    a = [float(x) for x in input().split()]
    X.append(a)
 
fig = plt.figure()

plt.ylabel('subframe ratio')
plt.xlabel('ABS ratio')
# ax = fig.add_subplot(233)
# im = ax.imshow(X, cmap=plt.cm.summer) #春
im = plt.imshow(X, cmap=plt.cm.bone)
plt.colorbar(im)                
 
 
plt.show()