#!/bin/bash

if [ ! -f .sbsync/config ];then
        exit 1
fi;

DIR=`grep -o "repos_.*$" .sbsync/config`

echo "DIR FOUND: $DIR";

git pull --ff origin `git branch --show-current`

./bin/sbsync;

ssh hn49 -t "cd $DIR; sbcli shell -- composer update lock;"

scp hn49:$DIR/composer.* .

