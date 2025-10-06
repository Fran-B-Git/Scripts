#!/bin/sh
echo "Checking target pages"
threadCount=16
user="gast"
password="creative"
export threadCount
export user
export password

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

export RED
export YELLOW
export GREEN
export NC

cat $1 |
  xargs -P $threadCount -I {} sh -c '
  checkSinglePage() {
  url=$1;
   response=$(curl "$url" $REDIRECT -u $user:$password -w "%{http_code}" -o /dev/null/ -s)
   
    if [ $response -eq 200 ]; then
      echo -e $GREEN $response : $url $NC
    elif [ $response -eq 301 ]; then 
      echo -e $YELLOW $response : $url $NC;
    else
      echo -e $RED $response : $url $NC;
    fi;
   
 }
 checkSinglePage "{}" $user $password'
