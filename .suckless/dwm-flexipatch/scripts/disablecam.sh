#!/bin/bash

# Get camera name from v4l2-ctl --list-devices
cam_name="A4 TECH USB2.0 PC Camera J"

cam_dev=$(v4l2-ctl --list-devices | grep -A 1 "$cam_name" | grep -o '/dev/video[0-9]')
cam_status=$(v4l2-ctl -d $cam_dev -C privacy)

if [[ $cam_status == "privacy: 0" ]]; then
	v4l2-ctl -d $cam_dev -c privacy=1
	notify-send "Webcam disabled 󰗟"
fi
if [[ $cam_status == "privacy: 1" ]]; then
	v4l2-ctl -d $cam_dev -c privacy=0
	notify-send "Webcam enabled 󰄀"
fi
