#!/bin/bash

setxkbmap -layout us,ir -option 'grp:win_space_toggle' &
tiramisu-herbe &
kmonad ~/.config/kmonad/config.kbd &
bash ~/Documents/Scripts/xrandr.sh &
dwmblocks &
