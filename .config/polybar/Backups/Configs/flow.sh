#!/bin/bash

pkill polybar
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/flow.config flow &
;polybar -r --config=/home/pringle/.config/polybar/oldconfigs/slimer.config bottom &

exit 0
