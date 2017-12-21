current="I really hope there's never an album called this 3424234242"
while :; do
	new="$(mpc current -f "%album%")"
	path="$(mpc -f "%file%" | cut -d $'\n' -f 1 | cut -f 1-2 -d "/")"
	playpause=`mpc | head -2 | tail -1 | awk '{print $1;}'`
	if [[ "$current" != "$new" ]]; then
		current="$(mpc current -f "%album%")"
		if [[ $playpause == "[playing]" || $playpause == "[paused]" ]]; then
			if [ -f "$HOME/usr/music/$path/cover_popup.png" ]; then
				pkill -f "lemonbar -g 130x130\+40\+83"*
				pkill -f "n30f -x 40 -y 83"*
				n30f -x 40 -y 83 "$HOME/usr/music/$path/cover_popup.png" &
			else
				pkill -f "n30f -x 40 -y 83"*
				pkill -f "lemonbar -g 130x130\+40\+83"*
				echo "%{c}No cover found" | lemonbar -g 130x130+40+83 -B "#FFfdf6e7" -F "#FF505050" -f tewi:size=10 -p &
			fi
		else
			pkill -f "n30f -x 40 -y 83"*
			pkill -f "lemonbar -g 130x130\+40\+83"*
			echo "%{c}Stopped" | lemonbar -g 130x130+40+83 -B "#FFfdf6e7" -F "#FF505050" -f tewi:size=10 -p &
		fi
	fi
	mpc idle
done
