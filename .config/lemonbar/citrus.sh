#!/usr/bin/env bash

# peels.sh - its the wrapper. Giggle.
BAR=${BAR:=$HOME/.config/lemonbar/peels.sh}
blah=nothing
# if running make it not so.
  if pgrep -cx lemonbar ; then
    pkill -ox -9 lemonbar
  fi

volume() {
  VOL="$(pamixer --get-volume)"
  GETMUTE="$(pamixer --get-mute)"

 	if [ "$VOL" = '0' ] || [ "$GETMUTE" = "true" ]; then
		printf ' %-5b%s' " \uf026 " "$VOL"
	else
		printf ' %-4b%s' " \uf028 " "$VOL"
  fi
}


memory() {
	awk '
   		/^MemTotal:/ {mem_total=$2}; /^MemFree:/ {mem_free=$2};
    	/^Buffers:/ {mem_free+=$2}; /^Cached:/ {mem_free+=$2};
    	/^MemAvailable:/ {mem_avail=$2};
    	END {
    	printf(" %.1fG (%.f%%)\n",
    	(mem_total-mem_free)/1024/1024 ,
    	mem_total/1024/1024, (100-  ( mem_avail / mem_total * 100))) }' \
	/proc/meminfo
}

clock() {
	#date "+%l:%M %a %d %b"
  printf '%-60s' "$(date "+%l:%M %a %d %b") "
}

battery() {

  pcharge="$(acpi | cut -d , -f 2 | sed 's/%*\r*$//')"
	bstate="$(grep -E 'Full|Charging|Unknown|Discharging' \
	/sys/class/power_supply/BAT1/status)"

typeset -gA icon
	icon=([Full]="\uf0e7"
				[Charging]="\uf1e6"
				[Discharging]="\uf241"
				)

	if [ "$pcharge" -le 25 ] ;then
	  printf '%b' " ${icon[$bstate]} "
	elif [ "$pcharge" -le 50 ] ;then
	  printf '%b' " ${icon[$bstate]} "
	elif [ "$pcharge" -le 75 ] ;then
	  printf '%b' " ${icon[$bstate]} "
	elif [ "$pcharge" -le 100 ] ;then
	  printf '%b' " ${icon[$bstate]}"
  fi

}

while true; do

  echo " %{C} %{B#63a690}$(battery)\
	$(volume) \
	$(memory) \
	$(clock)%{B-} %{C-}"
	sleep 5;
done | $BAR
