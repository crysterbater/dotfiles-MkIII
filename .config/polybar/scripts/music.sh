#!/bin/bash

icon=""

# The default behaviour is to display artist - title
# If behaviour != 0, only the album will be displayed instead
# The behaviour can be changed by clicking on the module in polybar

behaviour=0

if [ "$behaviour" -eq 0 ]
then

    player_status=$(playerctl status 2> /dev/null)
    if [[ $? -eq 0 ]]; then
	metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
    fi

else
    player_status=$(playerctl status 2> /dev/null)
    if [[ $? -eq 0 ]]; then
	metadata="$(playerctl metadata album)"
    fi

fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#D6D1C6}$icon ${metadata,,}"       # White when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#65737E}$icon ${metadata,,}"       # Greyed out info when paused
else
    echo "%{F##D6D1C6}$icon"                 # Greyed out icon when stopped
fi


# Changing behaviour
case "$1" in
    --click)
	if [ "$behaviour" -eq 0 ]
	then
	    sed -i 's,^\(behaviour=\).*,\1'1',' ~/.config/polybar/music.sh
	else
	    sed -i 's,^\(behaviour=\).*,\1'0',' ~/.config/polybar/music.sh
	fi
	;;
esac



