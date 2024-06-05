ip=`ifconfig wlo1 | grep -o "inet.*netmask" | grep -o " .* " | tr -d "\n\t\r "`
qrencode -o - -t ANSI "http://$ip:8000/count.html"
python -m http.server
