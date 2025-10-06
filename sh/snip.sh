scrot -s ~/Screenshots/clip.png -o -l mode=edge -e 'xclip -selection clipboard -t image/png -i -silent $f'
notify-send -t 400 "Screenshot Taken"
