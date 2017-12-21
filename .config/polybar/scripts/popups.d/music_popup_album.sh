while :; do
	playpause=`mpc | head -2 | tail -1 | awk '{print $1;}'`
	if [[ $playpause == "[playing]" || $playpause == "[paused]" ]]; then
		mpc current -f "Album:   %album%"
	else
		echo "Album:   none"
	fi
	mpc idle
done | lemonbar -g 240x13+180+83 -B "#FFfdf6e7" -F "#FF505050" -f tewi:size=10
