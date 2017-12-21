previous="awful hack"
while :; do
	current=`mpc | head -2 | tail -1 | awk '{print $1;}'`
	if [[ $previous != $current ]]; then
		if [[ $current == "[playing]" ]]; then
			n30f -x 280 -y 160 bin/popups.d/pause.png -c "mpc pause" &
			pkill -f "n30f -x 280 -y 160 bin/popups.d/play.png"*
		else
			n30f -x 280 -y 160 bin/popups.d/play.png -c "mpc play" &
			pkill -f "n30f -x 280 -y 160 bin/popups.d/pause.png"*
		fi
	fi
	previous=$current
	mpc idle
done
