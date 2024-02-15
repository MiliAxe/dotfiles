#!/bin/bash
duration=$(playerctl -p $(< ~/.config/polybar/scripts/tmplayer) metadata --format "{{ duration(position) }} / {{ duration(mpris:length) }}")
echo "$duration"

