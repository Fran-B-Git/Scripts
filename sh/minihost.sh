if [ $# -eq 0 ];then
	ip=`ip addr show wlp99s0 | grep "inet " | grep -oP "([0-9].)*" | grep -o "^.*/"`
	ip=${ip::-1}

else
	ip=$1
fi
qrencode -o - -t ANSI "http://$ip:8000/$1"
python3 -m http.server 
