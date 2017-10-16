exec 3>&1
y=$(dialog --title "Username" \
--inputbox "Enter your username" 10 30 \
								2>&1 1>&3)

exec 3>&-

# display values just entered

exec 3>&1
z=$(dialog --title "Password" \
--insecure \
--passwordbox "Enter your password" 10 30 \
								2>&1 1>&3)

exec 3>&-

# display values just entered
clear

x="ERROR: Can NOT recognize, try other."
t="loginpick"
check="login"

result=$(echo $t | grep "${check}")

while [ "$result" != "" ];
do
#	echo $result
	x="ERROR: Can NOT recognize, try other."
	while [ "$x" == "ERROR: Can NOT recognize, try other." ];
	do
#		echo "get" "$x"
		ind3=$(curl -c cj.txt -s https://portal.nctu.edu.tw/captcha/pic.php)
		curl -b cj.txt -s -o che1.jpg https://portal.nctu.edu.tw/captcha/pitctest/pic.php
		x=$( curl -X POST -s -F "image=@/net/cs/105/0516217/che1.jpg" https://nasa.cs.nctu.edu.tw/sap/2017/hw2/captcha-solver/api/ )
#		echo "get" "$x"
	done
	t=$(curl -b cj.txt -c cj.txt -s -d "username=$y&password=$z&seccode=$x&pwdtype=static&Submit2=Login" https://portal.nctu.edu.tw/portal/chkpas.php?)
#	echo $t
	result=$(echo $t | grep "${check}")

done

	q=$(curl -b cj.txt -s https://portal.nctu.edu.tw/portal/relay.php?D=cos | node extractFormdata.js)
	q=$(curl -b cj.txt -c cj.txt -s -d "$q" https://course.nctu.edu.tw/index.asp)
	q=$(curl -b cj.txt -s https://course.nctu.edu.tw/adSchedule.asp)
	q=$( echo $q | iconv -f big5 -t utf-8 )

# echo $q > pre01.txt

q=$( echo $q | \
awk -F'[><]' '{for(i=1;i<=NF;i++){if($i~/'$page_key'/){print $i}}}' | \
sed '1,140 d' | \
sed '/font/d;/tr/d;/td/d;/h2/d;/br/d;' | \
sed '/table/d;/center/d;/body/d;/html/d' | \
sed 's/^[[:space:]]*//g' | \
sed '/[A-Z0-1]/d' | \
sed 's/&nbsp/./g' | \
tr '\n' ' ' )

# echo $q > pre02.txt

# echo $q

# cat pre02.txt

# q=$(cat pre02.txt)

# echo $q

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


