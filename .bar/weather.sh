#!/usr/bin/env fish
# skr0tm at protonmail dot com

set bg "%{B{{ n_cyan }} }"
set reset "%{B{{ bgc }} }"

# set current weather
set weather (wtr)
echo "$bg%{A:wtr --update:} $weather  %{A}$reset"

