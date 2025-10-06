#!/bin/bash
a=`brightnessctl g`
b=`brightnessctl m`
echo "scale=2; $a/$b*100" | bc -l | sed "s/\.0*/%/g"