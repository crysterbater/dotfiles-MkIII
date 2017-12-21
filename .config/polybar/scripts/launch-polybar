#!/usr/bin/env bash

# config locations
CONF_PATH=$HOME/.config/polybar

# Check WM
cur_wm=$(wmctrl -m | grep Name | cut -d " " -f2)

if [[ $1 == --reload ]]; then
  if ! [[ $cur_wm == i3 ]]; then
    openbox --restart
    al-compositor --restart
    al-tint2restart
  else
    echo -e "WARN:  Option [--reload] not meant for i3..\n\nUse [Super]+[Shift]+r to reload i3\n"
  fi
fi

# Terminate already running bar instances
killall -q polybar

if pgrep -x "tint2" >/dev/null; then
  echo "Tint is running, not launching bars"
  exit 1
fi

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

echo "WM is $cur_wm... Launching appropriate bars"

# if i3 launch the i3-bar
if [[ $cur_wm == i3 ]]; then
  polybar -r --config=$CONF_PATH/config bar &
  polybar -r --config=$CONF_PATH/config bar1 &

else  # otherwise we assume openbox
  polybar -r --config=$CONF_PATH/config bar2 &
  polybar -r --config=$CONF_PATH/config bar3 &

fi

echo "Bars launched..."
