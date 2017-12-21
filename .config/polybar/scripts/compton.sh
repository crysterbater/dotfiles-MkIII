#!/usr/bin/env bash

#The icon that would change color
on="  "
off="  "
if pgrep -x "compton" > /dev/null
then
	echo "%{F#00C28E}$on"
else
	echo "%{F#FF4172}$on"
fi
