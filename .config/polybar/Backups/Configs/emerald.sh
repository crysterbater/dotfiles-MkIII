#!/bin/bash

pkill polybar
polybar -r --config=/home/pringle/.config/polybar/oldconfigs/emerald.config main_bar &
;polybar --config=/home/pringle/.config/polybar/oldconfigs/config bottom &

exit 0
