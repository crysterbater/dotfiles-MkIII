#!/bin/bash

pkill polybar
polybar -r --config=/home/pringle/.config/polybar/oldconfigs/rose.config main_bar &
;polybar --config=//home/pringle/.config/polybar/polybar/leaftop/leaftop-config vortex &

exit 0
