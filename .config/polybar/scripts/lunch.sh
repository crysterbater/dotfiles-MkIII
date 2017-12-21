#!/bin/sh

killall polybar
polybar BottomLeft -c ~/.config/polybar/config &
polybar BottomCenter -c ~/.config/polybar/config  &
polybar BottomRight -c ~/.config/polybar/config  &
polybar TopBar -c ~/.config/polybar/config &
