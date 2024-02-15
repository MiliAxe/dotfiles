if [[ $(playerctl -p $(node ~/.config/polybar/scripts/playerctl.js) status 2>&1) = "No players found" ]]; then
    exit 3
fi
if [[ $(playerctl -p $(node ~/.config/polybar/scripts/playerctl.js) status 2>&1) = "Stopped" ]]; then
    exit 3
fi
if [[ $(playerctl -p $(node ~/.config/polybar/scripts/playerctl.js) metadata 2>&1) = "No player could handle this command" ]]; then
    exit 3
fi
if [[ $(playerctl --list-all 2>&1 | wc -c) == 17 ]]
then
    exit 3
fi
