A=$1
B=$2

if [[ -z "$1" ]]
then
	A="2880"
fi

if [[ -z "$2" ]]
then
	B="1800"
fi

curl -L "https://picsum.photos/${A}/${B}" --output /tmp/lock.png

convert /tmp/lock.png RGB:- | i3lock --raw "${A}x${B}:rgb" --image /dev/stdin
