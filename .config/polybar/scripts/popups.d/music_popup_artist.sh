while :; do
	playpause=`mpc | head -2 | tail -1 | awk '{print $1;}'`
	if [[ $playpause == "[playing]" || $playpause == "[paused]" ]]; then
		mpc current -f "Artist:  %{F##FFeb2e42}%artist%"
	else
		echo "Artist:  %{F#FFeb2e42}none"
	fi
	mpc idle
done | lemonbar -g 240x13+180+110 -B "#FFfdf6e7" -F "#FF505050" -f tewi:size=10
