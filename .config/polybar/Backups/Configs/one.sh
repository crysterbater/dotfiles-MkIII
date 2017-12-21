#!/bin/bash

pkill polybar
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/eol-config top &
;polybar --config=/home/pringle/.config/polybar/oldconfigs/config bottom &

exit 0
