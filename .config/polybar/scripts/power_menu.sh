#!/bin/bash

res=$(echo "Search|rofi themes|bangs|xresources colorschemes|utilities|media|workspaces" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -width 9 -hide-scrollbar -eh 4 -location 3 -yoffset 50 -padding 12 -opacity 100 -font "Tewi 9" -auto-select -no-fullscreen)

if [ $res = "Search" ]; then
    zzzfoo
fi
if [ $res = "rofi themes" ]; then
    rofi-theme-selector
fi
if [ $res = "bangs" ]; then
    rofi-bangs.sh
fi
if [ $res = "xresources colorschemes" ]; then
    rofi -m -2  -i -p -modi drun,run,colorscheme:rofi-colorscheme-switch,keys,ssh,combi -show colorscheme:rofi-colorscheme-switch -show-icons true -me-select-entry '' -me-accept-entry 'Mouse1'
fi
if [ $res = "utilities" ]; then
    powermenu3.sh
fi
if [ $res = "media" ]; then
    powermenu4.sh
fi
if [ $res = "workspaces" ]; then
    rofi_workspaces.sh
fi
exit 0
