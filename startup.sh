source ~/Scripts/source.sh
git checkout -b backup
cp ~/.config/i3/config ~/Scripts/i3/config
git add ~/Scripts/i3/config
git add ~/Scritpts/startup.sh
git commit -m "i3 backup"
gitup
git checkout master
git merge backup
git -D backup