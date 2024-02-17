#!/bin/bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

mute_status=$(pactl get-source-mute @DEFAULT_SOURCE@)

if [[        $mute_status == "Mute: yes" ]]     ; then
	notify-send "Microphone muted "
fi

if [[ $mute_status == "Mute: no" ]]; then
	notify-send "Microphone unmuted 󰍬"
fi
