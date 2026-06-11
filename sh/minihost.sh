if [ $# -eq 0 ];then
	ip=`ip addr show wlp99s0 | grep "inet " | grep -oP "([0-9].)*" | head -n 1`
else
	ip=$1
fi
ip=http://$ip:8000
qrencode -o - -t ANSI "$ip"
echo $ip
python3 -m http.server 
