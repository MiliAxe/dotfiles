#!/bin/bash
DMENU_FONT="Terminus:size=10"
NORMBGCOLOR="#32302f"
NORMFGCOLOR="#fbf1c7"
SELBGCOLOR="#fbf1c7"
SELFGCOLOR="#32302f"
greenclip print | grep . | dmenu -i -l 10 -p clipboard -fn $DMENU_FONT -nb $NORMBGCOLOR -nf $NORMFGCOLOR -sb $SELBGCOLOR -sf $SELFGCOLOR | xargs -r -d'\n' -I '{}' greenclip print '{}'
