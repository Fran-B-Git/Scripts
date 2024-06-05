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

export PATH="/home/Scripts/:$PATH"

export VISUAL="nano"
export EDITOR="nano"


alias cls=clear
alias l=ls
alias left-of="xrandr --output HDMI-1 --auto --left-of eDP-1"
alias right-of="xrandr --output HDMI-1 --auto --right-of eDP-1"

alias mongo="~/Scripts/mongo.sh"
alias mobup="nmcli c up \"Fran's Galaxy A52s 5G\""
alias deskup="nmcli c up \"New 802-3-ethernet connection\""
alias hn49="ssh hn49"
alias repo="~/Scripts/repo.sh"
alias elastic="~/Scripts/elastic.sh"
alias note="~/Scripts/note.sh"
alias term="exec konsole & disown"

### git stuff

alias gitup='git push origin `git branch --show-current`'
alias gitdown='git pull --ff origin `git branch --show-current`'
