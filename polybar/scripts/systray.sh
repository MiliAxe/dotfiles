#!/bin/bash

# if pgrep stalonetray >/dev/null; then
# 	pkill -x stalonetray >/dev/null &
# 	polybar-msg action systray hook 0 &
# else
# 	setsid stalonetray -c ~/.cache/wal/stalonetrayrc &>/dev/null &
# 	polybar-msg action systray hook 1 &
# fi
#

# if (($(pidof stalonetray | wc -l) > 0))
# then
#   polybar-msg action systray hook 0
#   # pkill -9 stalonetray
#   xdo hide -n stalonetray
# else
#   polybar-msg action systray hook 1
#   # stalonetray -c ~/.cache/wal/stalonetrayrc &
#   xdo show -n stalonetray
# fi

if [[ $(cat ~/.config/polybar/scripts/traystatus) == "on" ]]
then
  # xdo hide -n stalonetray
  pkill stalonetray
  polybar-msg action systray hook 1
  echo "off" > ~/.config/polybar/scripts/traystatus
  exit 0
elif [[ $(pgrep stalonetray | wc -l) == 0 ]]
then
  stalonetray -c ~/.cache/wal/stalonetrayrc &
  polybar-msg action systray hook 0
  echo "on" > ~/.config/polybar/scripts/traystatus
  exit 0
elif [[ $(cat ~/.config/polybar/scripts/traystatus) == "off" ]]
then
  xdo show -n stalonetray
  xdo raise -n stalonetray
  polybar-msg action systray hook 0
  echo "on" > ~/.config/polybar/scripts/traystatus
fi
