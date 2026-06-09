#!/bin/bash

switch_case(){
	local text="$@"; 
	local length=${#text};
	local output="";
	for((i = 0; i < $length; i++));
	do
		el="${text:i:1}"
		fuck=$(($RANDOM % 2))
		if [ $fuck -gt 0 ]
		then
			output="${output}${el,,}"
		else
			output="${output}${el^^}"
		fi
	done
	echo $output
}

while [ 1 -lt 2 ]; do
	clear
	goof=$(switch_case "$@")
	cowsay -f fox "$goof"
	sleep 0.5;
done;
