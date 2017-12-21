#!/usr/bin/env fish

set font '-*-lemon-medium-r-*-*-*-*-*-*-m-*-iso10646-1'
set font2 '-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1'
set ph 25
set pw 1920
set py 0
set px 0


killall admiral
killall lemonbar

admiral -c $HOME/.bar/admiral.toml | lemonbar -p -b -f "$font" -g $pw"x$ph+$px+$py" -B '{{ fgc }}' -F '{{ bgc }}' | sh
