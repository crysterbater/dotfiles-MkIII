  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62
 63
 64
 65
 66
 67
 68
 69
 70
 71
 72
 73
 74
 75
 76
 77
 78
 79
 80
 81
 82
 83
 84
 85
 86
 87
 88
 89
 90
 91
 92
 93
 94
 95
 96
 97
 98
 99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131



#! /bin/sh

PANEL_WM=panel_top
PANEL_FIFO=/tmp/panel_top_fifo

if xdo id -a "$PANEL_WM" > /dev/null ; then
    printf "%s\n" "The panel is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

source $(dirname $0)/config_bar

getName() {
    local icon=$(pIconUnderline ${WHITE} ${RED2} ${GENTOO})
    local cmd="$(uname -n)"
    local cmdEnd=$(pTextUnderline ${WHITE} ${RED} " ${cmd}")
    echo " ${icon}${cmdEnd}"
}

getMyIp() {
    local icon=$(pIcon ${YELLOW} ${CIP})
    local cmd="$(curl -s https://ifcfg.me/)"
    local cmdEnd=$(pText ${WHITE} "${cmd}")
    echo " ${icon} ${cmdEnd} ${icon}"
}

getDay() {
    local icon=$(pIconUnderline ${GREEN} ${BLACK2} ${CTIME})
    local cmd=" $(date '+%A %d %b')"
    local cmdEnd=$(pTextUnderline ${WHITE} ${BLACK} "${cmd}")
    echo "${icon}${cmdEnd}"
}

clock() {
    local icon=$(pIcon ${GREEN} ${CCLOCK})
    local cmd=$(date +%H:%M)
    local cmdEnd=$(pText ${FG} "${cmd}")
    echo "${icon} ${cmdEnd}"
}

mail() {
    local gmaildir=/home/user/.mails/Gmail/\[Gmail\].All\ Mail/new
    local cmd=$(pAction ${GREEN} ${BG} "i3 'exec termite -e mutt'" ${CMAIL})
    local count=0
    if [[ ! -n $(ls "${gmaildir}") ]]; then
        count=0
    else
        count=$(ls -1 "${gmaildir}" | wc -l)
    fi
    echo "${cmd} ${count}"
}

energy() {
    local ac=/sys/class/power_supply/AC/online
    local bat=/sys/class/power_supply/BAT0/present
    local icon=""
    local batCap=""
    if [[ -e $bat ]] && [[ $(cat $ac) -lt 1 ]]; then
        batCap="$(cat ${bat%/*}/capacity)"
        [ $batCap -gt 90 ] && icon=$BAT100
        [ $batCap -gt 70 ] && [ $batCap -lt 90 ] && icon=$BAT70
        [ $batCap -gt 50 ] && [ $batCap -lt 70 ] && icon=$BAT50
        [ $batCap -gt 30 ] && [ $batCap -lt 50 ] && icon=$BAT30
        [ $batCap -gt 15 ] && [ $batCap -lt 30 ] && icon=$BAT15
        [ $batCap -lt 7 ] && icon=$BAT7
    elif [[ -n $(cat $ac) ]]; then
        batCap="AC"
        icon=$CAC
    else
        batCap="wttf"
    fi
    echo "$(pIcon ${GREEN} $icon) $(pText "#685667" ${batCap})"
}

ws() {
    local cmd=$(i3-msg -t get_outputs | sed 's/.*"current_workspace":"\([^"]*\)".*/\1/')
    local icon=$(pIcon ${GREEN} " >> " )
    local icon2=$(pIcon ${GREEN} " << " )
    local cmdEnd=$(pText ${FG} "${cmd}")
    echo "${icon} ${cmdEnd} ${icon2}"
}

{
    while :; do
        echo "A$(ws)"
        sleep 0.4 || break
    done > "$PANEL_FIFO" &

    while :; do
        echo "W$(getName) $(getMyIp)"
        echo "R$(energy) $(mail) $(getDay) $(clock)"
        sleep 1 || break
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
                sysC="${line#?}"
                ;;
            R*)
                sysR="${line#?}"
                ;;
        esac
        printf "%s\n" "%{l}${sysL}%{c}${sysC}%{r}${sysR}"
    done
} < "$PANEL_FIFO" | lemonbar \
    -g x35} -u 2 -B ${BG} -F ${FG} -f "${FONT}" -f "${FONT_ICON}" | sh &

wid=$(xdo id -a "$PANEL_WM")
tries_left=20

while [ -z "$wid" -a "$tries_left" -gt 0 ] ; do
    sleep 0.05
    wid=$(xdo id -a "$PANEL_WM")
    tries_left=$((tries_left - 1))
done

[ -n "$wid" ] && xdo above -t "$(xdo id -N I3Top -n root | sort | head -n 1)" "$wid"

wait
