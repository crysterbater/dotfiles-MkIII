#!/bin/bash

BACKGROUND=#212121
FOREGROUND=#000000
GEO=220x22+5+5
MONITOR="LVDS"

#PRIMARYFONT="-*-tamsyn-medium-r-normal-*-12-*-*-*-*-*-*-1"
PRIMARYFONT='DejaVu\ Sans\ Condensed:autohint=0:hinting=0:size=9'
#SECONDARYFONT='DejaVuSansMono\ Nerd\ Font-10:style=Book'
lemonbar -B "$BACKGROUND" -F "$FOREGROUND" -p -b -d -g "$GEO" \
-f "$PRIMARYFONT" -f "$SECONDARYFONT" "$MONITOR"
