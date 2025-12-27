#!/bin/bash

setxkbmap -layout us,ir -option 'grp:alt_space_toggle' &
tiramisu-herbe &
bash ~/.suckless/dwm-flexipatch/scripts/xrandr.sh &
dwmblocks &
