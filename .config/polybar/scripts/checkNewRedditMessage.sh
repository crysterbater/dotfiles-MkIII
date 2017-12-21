#!/bin/sh
pid=0
while true; do
	wget "" -q -O - | grep -q "t4" #put reddit json unread messages rss feed
	messageFound=$?
	if [ "$messageFound"  -eq 0 ]; then
		if [ "$pid" -eq 0 ]; then
			echo Start Flash
			sh ./blinkLED.sh &
			pid=$!
			echo $pid
		fi
	elif [ $pid -ne 0 ]; then
			echo Stop Flash
			kill $pid
			pid=0
	fi
	sleep 1
done
