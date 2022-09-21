#!/bin/bash
duration=$(playerctl -p $(cat /tmp/player) metadata --format "{{ duration(position) }} / {{ duration(mpris:length) }}")
echo "$duration"

