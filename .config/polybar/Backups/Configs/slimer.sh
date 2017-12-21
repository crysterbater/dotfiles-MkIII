#!/bin/bash

pkill polybar
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/slimer.config top &
polybar -r --config=/home/pringle/.config/polybar/oldconfigs/slimer.config bottom &

exit 0
