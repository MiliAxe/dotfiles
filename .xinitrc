systemctl --user import-environment DISPLAY XAUTHORITY

systemctl --user start darkman.service

export QT_QPA_PLATFORMTHEME=gtk3

dark_status=$(darkman get)
bash ~/.local/share/darkman/wpg.sh $dark_status

exec dwm
