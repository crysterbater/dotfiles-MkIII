#!/bin/bash

pkill polybar
polybar -r --config=/home/pringle/.config/polybar/oldconfigs/cyb-config default &
;polybar --config=//home/pringle/.config/polybar/polybar/leaftop/leaftop-config vortex &

exit 0
