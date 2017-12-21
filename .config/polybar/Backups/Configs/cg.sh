#!/bin/bash

pkill polybar
polybar -r --config=/home/pringle/.config/polybar/oldconfigs/cleangreen.config main &
;polybar --config=//home/pringle/.config/polybar/polybar/leaftop/leaftop-config vortex &

exit 0
