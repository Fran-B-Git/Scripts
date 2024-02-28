scrot -s ~/Screenshots/clip.png -o -l mode=edge -e 'xclip -selection clipboard -t image/png -i -silent $f';
pinta ~/Screenshots/clip.png
