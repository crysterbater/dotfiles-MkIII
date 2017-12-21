#!/bin/bash

pkill polybar
polybar -r --config=/home/pringle/.config/polybar/oldconfigs/arrows.config main &
;polybar -r --config=/home/pringle/.config/polybar/oldconfigs/slimer.config bottom &

exit 0
