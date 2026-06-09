### source for stuff

lildude="/mnt/lilDude"
DIR="/mnt/lilDude/Scripts"
function catcode(){
    
    if [ -z $1 ]
    then
        target="https://http.cat/images/$(cat /dev/stdin).jpg"
    else
        target="https://http.cat/images/$1.jpg"
    fi;
    
    curl -s $target | convert - -edge 5 -blur 0x3 - | ascii-image-converter -b  -
    
}
shopt -s expand_aliases

if test -f $DIR/sh/localsource.sh; then
	source $DIR/sh/localsource.sh
fi

alias cls=clear
alias l=ls
alias left-of="xrandr --output HDMI-1 --auto --left-of eDP-1"
alias right-of="xrandr --output HDMI-1 --auto --right-of eDP-1"
alias bat=batcat

alias mobup="nmcli c up \"goofytime\""
alias deskup="nmcli c up \"share_internet\""
alias hn49="ssh hn49"
alias repo="$DIR/sh/repo.sh"
alias elastic="$DIR/sh/elastic.sh"
alias note="$DIR/sh/note.sh"
alias minihost="$DIR/sh/minihost.sh"
alias raygrep="$DIR/sh/raygrep.sh"
# alias cava="~/cava/cava"
alias status="$DIR/sh/fancy.sh"
alias livestatus="$DIR/sh/livestatus.sh"
alias bobr="ascii-image-converter -C --color-bg -m \"   \" ~/Pictures/shitpost/bobr-removebg-preview.png"
alias filewatch="while inotifywait -r ./*; do ./bin/sbsync ; done;"
alias bigmanblastoise="$DIR/sh/bigmanblastoise.sh"
alias blastoisenotif="$DIR/sh/notifyblastoise.sh"
alias kys=exit 
alias csync="$DIR/sh/composer_sync.sh"
alias acsync="$DIR/sh/auto_composer_sync.sh"
### git stuff

alias gitup='git push origin `git branch --show-current`'
alias gitdown='git pull --ff origin `git branch --show-current`'

### DIRECTORY STUFF

alias kino=". $DIR/sh/workdir kino-bob"
alias giga=". $DIR/sh/workdir giga-bob"
alias des=". $DIR/sh/workdir desired-bob"
alias fam=". $DIR/sh/workdir familie-bob"
alias saf=". $DIR/sh/workdir spielaffe-bob"
alias common=". $DIR/sh/workdir bob-common"
alias dev=". $DIR/sh/workdir bob-common-dev"
