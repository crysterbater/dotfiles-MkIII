#! /bin/sh

PANEL_WM=panel_bottom
PANEL_FIFO=/tmp/panel_bottom_fifo

if xdo id -a "$PANEL_WM" > /dev/null ; then
    printf "%s\n" "The panel is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

source $(dirname $0)/config_bar

music() {
    local icon=$(pIcon ${GREEN} ${CSOUND})
    local stat="$(mpc status | grep \# | awk '{print $1}')"
    local artist=$(mpc -f %artist% current)
    local musicname=$(mpc -f %title% current)
    local cmd=""

    if [ "${stat}" ] && [ "${stat}" = "[playing]" ] ; then
        cmd=" Playing >> ${artist:0:10} - ${musicname:0:15}"
    elif [ "${stat}" ] && [ "${stat}" = "[paused]" ] ; then
        cmd=" Paused >> ${artist:0:10} - ${musicname:0:15}"
    else
        cmd=" No Sound"
    fi

    echo "${icon}$(pText ${WHITE} "${cmd}")"
}

volume() {
    local icon=$(pIcon ${GREEN} ${CVOLUME})
    local cmd="$(mpc volume | awk '{print $2}')"
    [[ -z ${volume%?} ]] && volume='100%'
    local clr=$(pText ${FG} "${cmd}")
    echo "${icon} ${clr}"
}

net() {
    local _GETIWL=$(/sbin/iwgetid -r)
    local _GETETH=$(ip a | grep "state UP" | awk '{ORS=""}{print $2}' | cut -d ':' -f 1)
    local _status=${_GETIWL:-$_GETETH}
    local _status2="${_status:-Down}"
    local icon="$(pIcon ${GREEN} ${CNET})"
    local cmd=$(pText ${WHITE} " ${_status2}")

    echo "${icon}${cmd}"
}

wifi_str() {
    local _icon=$(pIcon ${GREEN} ${WIFI_STR})
    local _cmd=$(/sbin/iwconfig 2>/dev/null | grep "Link Quality" | cut -d "=" -f 2 | awk '{print $1}')
    echo "${_icon} ${_cmd}"
}

cpu() {
    local icon=$(pIcon ${GREEN} ${CCPU})
    local cmd=" $(cat /proc/loadavg | awk '{print $1}')"
    local cmd+=" $(cat /proc/loadavg | awk '{print $4}')"
    local cmd+=" $(cat /proc/cpuinfo| grep MHz | awk '{ORS=" "}{print $4}' | sed -e 's/.000//g' | cut -f 1)"

    local clr=$(pText ${WHITE} "${cmd}")
    echo "${icon}${clr}"
}

ram() {
    local icon=$(pIcon ${GREEN} ${CRAM})
    local cmd=$(free -m | grep Mem | awk '{print $3}')
    cmd+=" Mb"
    local clr=$(pText ${WHITE} "${cmd}")
    echo "${icon} ${clr}"
}

{
    while :; do
        echo "W$(music) $(volume)"
        echo "A$(cpu) $(ram)"
        echo "R$(wifi_str) $(net)"
        sleep 1
    done > "$PANEL_FIFO" &
}

{
    while read -r line ; do
        cmd=( $line )
        case "${cmd[0]}" in
            W*)
                sysL="${line#?}"
                ;;
            A*)
                wm="${line#?}"
                ;;
            R*)
                sysR="${line#?}"
                ;;
            reload)
                exit
                ;;
            quit_panel)
                exit
                ;;
        esac
        printf "%s\n" "%{l}${sysL}%{c}${wm}%{r}${sysR}"
    done
} < "$PANEL_FIFO" | lemonbar \
    -g x${HEIGHT} -u 2 -B ${BG} -F ${FG} -f "${FONT}" -f "${FONT_ICON}" -b | sh &

wid=$(xdo id -a "$PANEL_WM")
tries_left=20

while [ -z "$wid" -a "$tries_left" -gt 0 ] ; do
    sleep 0.05
    wid=$(xdo id -a "$PANEL_WM")
    tries_left=$((tries_left - 1))
done

[ -n "$wid" ] && xdo above -t "$(xdo id -N I3Bottom -n root | sort | head -n 1)" "$wid"

wait
