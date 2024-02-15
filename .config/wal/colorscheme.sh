#!/bin/bash

wal -e -n -i $1
wpg -s $1
pywal-discord
pywalfox update
spicetify apply
wal_steam >/dev/null
# genzathurarc >> ~/.config/zathura/zathurarc
# killall -q xborders
cp /home/mili/.cache/wal/dunstrc /home/mili/.config/dunst/dunstrc
cp /home/mili/.cache/wal/pywal.json /home/mili/.local/share/Anki2/addons21/688199788/themes/pywal.json
cp /home/mili/.cache/wal/flameshot.ini /home/mili/.config/flameshot/flameshot.ini
cp ~/.cache/wal/pywal.colors ~/.local/share/krita/color-schemes/pywal.colors
cp ~/.cache/wal/pywal.css ~/.config/tridactyl/themes/pywal.css
wal-telegram --wal --tiled -r >/dev/null 2>&1 &
# ~/.config/i3/xborder/xborders --disable-version-warning -c /home/mili/.cache/wal/xborder.json >/dev/null 2>&1 &
kitty @set-colors --all --configured ~/.config/kitty/kitty.conf
# wpg -n -s $1
# bash /home/mili/.config/polybar/launch.sh 

killall -q dunst 
dunst -conf /home/mili/.cache/wal/dunstrc &!
