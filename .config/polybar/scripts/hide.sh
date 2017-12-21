#!/usr/bin/env bash

# Find the windows name
$ xprop | grep WM_NAME
WM_NAME(STRING) = "polybar-default_eDP1"

# Hide it
$ /home/pringle/bin/hideIt.sh --name "polybar-default_eDP1" --hover -i 0.3
