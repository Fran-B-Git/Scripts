### source for stuff

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

if test -f ./localsource.sh; then
	source ./localsource.sh
fi

alias cls=clear
alias l=ls
alias left-of="xrandr --output HDMI-1 --auto --left-of eDP-1"
alias right-of="xrandr --output HDMI-1 --auto --right-of eDP-1"

alias mobup="nmcli c up \"goofytime\""
alias deskup="nmcli c up \"share_internet\""
alias hn49="ssh hn49"
alias repo="~/Scripts/repo.sh"
alias elastic="~/Scripts/elastic.sh"
alias note="~/Scripts/note.sh"
alias minihost="~/Scripts/minihost.sh"
alias raygrep="~/Scripts/raygrep.sh"
# alias cava="~/cava/cava"
alias status="~/Scripts/fancy.sh"
alias livestatus="~/Scripts/livestatus.sh"
alias bobr="ascii-image-converter -C --color-bg -m \"   \" ~/Pictures/shitpost/bobr-removebg-preview.png"
alias filewatch="while inotifywait -r ./*; do ./bin/sbsync ; done;"
alias bigmanblastoise="~/Scripts/bigmanblastoise.sh"
alias blastoisenotif="~/Scripts/notifyblastoise.sh"
### git stuff

alias gitup='git push origin `git branch --show-current`'
alias gitdown='git pull --ff origin `git branch --show-current`'

### DIRECTORY STUFF

alias kino=". ~/Scripts/workdir kino-bob"
alias giga=". ~/Scripts/workdir giga-bob"
alias des=". ~/Scripts/workdir desired-bob"
alias fam=". ~/Scripts/workdir familie-bob"
alias saf=". ~/Scripts/workdir spielaffe-bob"
alias common=". ~/Scripts/workdir bob-common"
