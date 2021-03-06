#!/bin/bash

BS="10 25 40 55 70"
user="100 250 400 550 700"
ABS="1 3 5 7 9"
subframe="1 3 5 7 9"
basic="BSRandomLoc"
ta="b"
tb="u"
tc="a"
td="s"
dic="dictate"
all="all"
cen="center"
edg="edge"
data="AllData/"

for i in $BS
do
	ti="$i$ta"
	echo $ti
	mkdir -p $basic/$ti
	for j in $user
	do
		tmp=".view"
		gra=".graph"
		tj="$j$tb"
		rep="$basic/$ti/$ti$tj/"
# 		python3 makegraph.py < $rep$dic > $rep$dic$gra
		python3 makeform.py < $rep$all > $data$ti$tj$all$tmp
		python3 makeform.py < $rep$edg > $data$ti$tj$edg$tmp
		python3 makeform.py < $rep$cen > $data$ti$tj$cen$tmp
	done
done
