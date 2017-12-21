#!/bin/bash

pkill polybar
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/tak.sh takmobar &
;polybar --config=/home/dead/.config/polybar/Backups/Configs/tak.sh bottom &

exit 0
