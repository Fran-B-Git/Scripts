# found fixes for problems on manjaro / linux laptop
[OG link](https://docs.google.com/document/d/1XkDPQqpmZLGNraAMVHqrHVrvYCX7os228FCXvnCbS8I/edit?tab=t.0)

## AUDIO issues 
- https://forum.manjaro.org/t/audio-not-working/76607
    - `rm ~/.config/pulse/*.tdb ~/.config/pulse/cookie`

- Other option : https://forum.manjaro.org/t/no-sound-to-laptop-speakers/10869 6/33
    - `sudo mkinitcpio -P; sudo reboot`
    - Wifi nestane nakon update-a -> updateaj kernel

## GUI HIGHDPI scaling -> /etc/environment 
```sh
GDK_SCALE=1
QT_AUTO_SCREEN_SCALE_FACTOR=0
QT_SCREEN_SCALE_FACTORS=2
```
