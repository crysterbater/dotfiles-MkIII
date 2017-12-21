#!/bin/bash

pkill polybar
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/misc.config left &
polybar -r --config=/home/dead/.config/polybar/Backups/Configs/misc.config right &

exit 0
