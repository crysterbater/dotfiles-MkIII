#!/usr/bin/env bash

online=$(ip addr | grep "state UP" | cut -d ":" -f2)

#connected=""
#offline=""
connected=""
offline=""
if [[ "$online" ]]; then
  echo " %{F#23EFDC}${connected} "
else
  echo " %{F#23EFDC}${offline} "; sleep 1; echo " %{F#FDEE7B}${offline} "
fi
