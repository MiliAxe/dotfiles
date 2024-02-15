# if (($(pgrep picom | wc -l) > 0))
# then
# 	polybar-msg action picom hook 0
# 	pkill -9 picom
# else
# 	polybar-msg action picom hook 1
# 	picom
# fi

if [[ $(cat ~/.config/polybar/scripts/picomstatus) == "transparent" ]]
then
	pkill -9 picom
	picom &!
	echo "nottransparent" > ~/.config/polybar/scripts/picomstatus
	polybar-msg action picom hook 1
else
	pkill -9 picom
	picom --config ~/.config/picom/picomnotransparency.conf &!
	echo "transparent" > ~/.config/polybar/scripts/picomstatus
	polybar-msg action picom hook 0
fi
