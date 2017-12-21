#!/bin/bash

pkill polybar
polybar -r --config=/home/pringle/.config/polybar/Backups/cngn.config main &
;polybar --config=/home/pringle/.config/polybar/oldconfigs/config bottom &

exit 0
