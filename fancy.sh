#!/bin/bash

clear
D=${1-${BAR-95}}
printf -- '=%0.s' `seq $D`
echo ""
curl -s -L https://vrijeme.hr/zggric.jpg --output - | ascii-image-converter - -C --color-bg -m "  " -W $D
printf -- '=%0.s' `seq $D`
echo ""
echo -e '\033[0;32m'
/usr/share/i3blocks/wttrin
echo -e '\033[0m'
