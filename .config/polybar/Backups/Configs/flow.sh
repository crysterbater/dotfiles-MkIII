#!/bin/bash

pkill polybar
polybar -l info --config=/home/dead/.config/polybar/Backups/fuk.config barii0 &
polybar -r --config=/home/dead/.config/polybar/Backups/fuk.config barii01 &
polybar -r --config=/home/dead/.config/polybar/Backups/fuk.config barii02 &
polybar -r --config=/home/dead/.config/polybar/Backups/fuk.config barii03 &
polybar -r --config=/home/dead/.config/polybar/Backups/fuk.config barii04 &
exit 0
