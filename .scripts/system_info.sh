#!/bin/bash

#fg='%{F#909090}'
path=~/.dotfiles/bar
fg='%{F#999}'
offset='%{O10}'

case $1 in
	MAIL*) 
		username="sola931"
		password="sola9090"
		mail_icon="%{A:xfce4-terminal -e mutt:} %{A}"
		mail_count=$(curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom" | xmllint --format - | awk -F '[><]' '/fullcount/ {print $3}')
		[[ $mail_count -gt 0 ]] && mail="$mail_icon $mail_count mail" && space=$offset
		[[ $mail_count -gt 1 ]] && mail+="s"

		echo -e "$fg$space$mail$space" ;;
	VOLUME*)
		command="amixer set Master playback 10%+"
		value=$(amixer get Master | sed -n '$s/.*\[\(.*%\).*/\1/p')
		volume="$($path/volume.sh SYSTEM "$command" "$value")"

		echo -e "$fg$offset$volume$offset" ;;
	DATE*) echo -e "$fg$offset%{A:orage &:}$(date +"%d %b, %I:%M")%{A}$offset" ;;
	TERM)
		id=$(wmctrl -l | awk '/DROPDOWN/ {print $1}')

		if [[ $id ]]; then
			color="999"
			term_icon=" "
			term="%{F#$color}%{A:~/.dotfiles/scripts/toggle_drop_down.sh $id:}$term_icon%{A}"
		fi

		echo -e "$term" ;;
	SHUT_DOWN) echo -e "$fg%{O10}%{A:$path/shut_down.sh &:} %{A}%{O7}"
esac
