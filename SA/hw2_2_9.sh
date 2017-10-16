q=$(cat ./pre02.txt)

countTest=0
tek=7
IFS=$' '       # make newlines the only separator
q=$(echo "Mon. Tue. Wed. Thu. Fri. Sat. Sun."
for j in $q
do
	countTest=`expr $countTest + 1`
	if [ "$countTest" == "$tek" ]; then
		tek=`expr $tek + 7`
		printf "$j\n"
	else
		printf "$j "
	fi
#    printf "$j"
#	printf "$countTest and $tek"
done)

echo $q | column -t
