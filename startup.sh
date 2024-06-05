source ~/Scripts/source.sh
cd ~/i3config/
cp ~/.config/i3/config .
git add config
git commit -m "i3 backup"
git push origin `git branch --show-current`