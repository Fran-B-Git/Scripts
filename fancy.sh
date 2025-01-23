#!/bin/bash

clear
printf -- '=%0.s' {1..95}
echo ""
curl -s -L https://vrijeme.hr/zggric.jpg --output - | ascii-image-converter - -b --dither -C -W 95
printf -- '=%0.s' {1..95}
echo ""
echo -e '\033[0;32m'
/usr/share/i3blocks/wttrin
echo -e '\033[0m'
