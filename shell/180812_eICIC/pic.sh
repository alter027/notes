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
all="_all.txt"
center="_center.txt"
edge="_edge.txt"

for i in $BS
do
	ti="$i$ta"
	echo $ti
	mkdir -p $basic/$ti
	for j in $user
	do
		tj="$j$tb"
		mkdir -p $basic/$ti/$ti$tj
		for k in $ABS
		do
			for l in $subframe
			do
			rep="$basic/$ti/$ti$tj/"
			tmp="$basic/$ti/$ti$tj/$k$tc$l$td"
			# echo "$rep" > tri
			# echo "$tmp$all" >> tri
			# echo "$tmp$center" >> tri
			# echo "$tmp$edge" >> tri
            python3 mean_var.py < tri
			done
		done
	done
done
