while :; do
	playpause=`mpc | head -2 | tail -1 | awk '{print $1;}'`
	if [[ $playpause == "[playing]" || $playpause == "[paused]" ]]; then
		mpc current -f "Title:   %{F##FF236f62}%title%"
	else
		echo "Title:   %{F#FF236f62}none"
	fi
	mpc idle
done | lemonbar -g 240x13+180+123 -B "#FFfdf6e7" -F "#FF505050" -f tewi:size=10
