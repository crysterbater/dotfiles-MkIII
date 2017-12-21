#!/bin/bash
playedcolour=55AAEB
leftcolour=505050

while true; do
	playpause=`mpc | head -2 | tail -1 | awk '{print $1;}'`
	if [[ $playpause == "[playing]" || $playpause == "[paused]" ]]; then
		elapsed="$(bc <<< "$(mpc | grep -o '[(0-9][0-9]%)' | grep -o "[0-9]*")/2.632")"
		togo="$(expr 38 - $elapsed)"
		progress1="$(eval "printf "_%.0s" {0..$elapsed}")"
		progress2="$(eval "printf "_%.0s" {0..$togo}")"
	else
		progress1=""
		progress2="$(eval "printf "_%.0s" {0..38}")"
	fi
	echo "%{F#FF$playedcolour}$progress1%{F#FF$leftcolour}$progress2"
	sleep 0.2
done | lemonbar -g 240x13+180+204 -B "#FFfdf6e7" -f tewi:size=10
