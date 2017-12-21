#!/bin/bash

pkill polybar
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/two.config top &
;polybar --config=//home/pringle/.config/polybar/polybar/leaftop/leaftop-config vortex &

exit 0
