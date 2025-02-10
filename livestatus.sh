#!/bin/bash
TIME=20
count=0
source ~/Scripts/source.sh
while [ 1 -gt 0 ]
do
	cls
	status
	while [ $count -lt $TIME ]
	do
		echo -ne "\rsleeping $count/$TIME seconds"
		sleep 1
		count=$(($count+1))
	done

	count=1

done
