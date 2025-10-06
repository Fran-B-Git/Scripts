#!/bin/bash

if [ ! -f .sbsync/config ];then
	exit 1
fi;

DIR=`grep -o "repos_.*$" .sbsync/config`

scp hn49:$DIR/composer.* .
