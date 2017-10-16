
curl -o ind3.html -c cj.txt https://portal.nctu.edu.tw/captcha/pic.php 
curl -b cj.txt -o che1.jpg https://portal.nctu.edu.tw/captcha/pitctest/pic.php
curl -X POST -F "image=@/home/alter027/Desktop/che1.jpg" https://nasa.cs.nctu.edu.tw/sap/2017/hw2/captcha-solver/api/ > seccode.txt

x=$(cat seccode.txt)
y=$(cat username.txt)
z=$(cat password.txt)

echo "get" "$x"

if [ "$x" == "ERROR: Can NOT recognize, try other." ]; then
	echo "try again"
else
	curl -b cj.txt -c cj1.txt -o ind4.html -d "username=$y&password=$z&seccode=$x&pwdtype=static&Submit2=Login" https://portal.nctu.edu.tw/portal/chkpas.php?
	curl -b cj1.txt https://portal.nctu.edu.tw/portal/relay.php?D=cos | node extractFormdata.js	> html2url.txt
	q=$(cat html2url.txt)
	curl -b cj1.txt -c cj2.txt -o ind5.html -d "$q" https://course.nctu.edu.tw/index.asp
	curl -b cj2.txt -o ind6.html https://course.nctu.edu.tw/adSchedule.asp
	iconv -f big5 -t utf-8 ind6.html -o ind7.html
fi

