export HOME="$(echo "/home/$USER")"
exist="$(pgrep -f "n30f -x 78 -y 65"*)"
if [[ -z "$exist" ]]; then
		n30f -x 78 -y 65 bin/popups.d/triangle.png &
		cat /dev/null | lemonbar -g 400x150+30+73 -B "#FFfdf6e7" -p &
		n30f -x 180 -y 160 bin/popups.d/backward.png -c "mpc prev" &
		n30f -x 390 -y 160 bin/popups.d/forward.png -c "mpc next" &
		bash $HOME/bin/popups.d/music_popup_cover.sh & disown
		bash $HOME/bin/popups.d/music_popup_album.sh & disown
		bash $HOME/bin/popups.d/music_popup_artist.sh & disown
		bash $HOME/bin/popups.d/music_popup_title.sh & disown
		bash $HOME/bin/popups.d/music_popup_controls.sh & disown
		bash $HOME/bin/popups.d/music_popup_progress.sh & disown
	else
		pkill -f "n30f -x 78 -y 65"*
		pkill -f "lemonbar -g 400x150\+30\+73"*
		pkill -f "n30f -x 40 -y 83"*
		pkill -f "lemonbar -g 130x130\+40\+83"*
		pkill -f "lemonbar -g 240x13\+180\+83"*
		pkill -f "lemonbar -g 240x13\+180\+110"*
		pkill -f "lemonbar -g 240x13\+180\+123"*
		pkill -f "n30f -x 280 -y 160"*
		pkill -f "n30f -x 390 -y 160"*
		pkill -f "n30f -x 180 -y 160"*
		pkill -f "lemonbar -g 240x13\+180\+204"*
		pkill -f "bash bin/popups.d/music_popup"*
	fi
