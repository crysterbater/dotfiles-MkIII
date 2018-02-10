#!/bin/bash

path=/home/pringle/bin/rofi/rofi_scripts

modis+="window,"
modis="my_apps:/home/dead/bin/rofi/rofi_scripts/rofi_my_apps.sh,run,"
modis+="window_action:/home/dead/bin/rofi/rofi_scripts/rofi_window_action.sh,"
modis+="workspaces:/home/dead/bin/rofi/rofi_scripts/rofi_workspaces.sh,"
modis+="move_to:/home/dead/bin/rofi/rofi_scripts/rofi_workspaces.sh move,"
modis+="media:/home/dead/bin/rofi/rofi_scripts/rofi_media.sh,"
modis+="mount:/home/dead/bin/rofi/rofi_scripts/rofi_mount.sh,"
modis+="shutdown:/home/dead/bin/rofi/rofi_scripts/rofi_shutdown.sh"
rofi -modi "$modis" -show $1

