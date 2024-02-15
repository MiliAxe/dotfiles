#!/usr/bin/env bash

zscroll --delay 0.3 -l 20 \
		--match-command "bash /home/mili/.config/polybar/scripts/currentplayerstatus" \
		--match-text "Playing" "--before-text ' '" \
		--match-text "Paused" "--before-text ' ' --scroll 0" \
		--match-text "Offline" "--before-text '' --scroll 0" \
		--update-check true "bash /home/mili/.config/polybar/scripts/currentplayermeta" &

wait
#
# --match-text "" "--before-text 'Offline' --scroll 0" \
