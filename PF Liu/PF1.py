import math

while True:
	length=int(input())
	width=int(input())
	height=int(input())

	a=length*width
	b=width*height
	c=length*height

	print('the surface area is {} '.format(2*(a+b+c)))
	print('the volumn is {} '.format(math.sqrt(a*b*c)))
