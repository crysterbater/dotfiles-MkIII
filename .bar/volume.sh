#!/bin/bash

outstr=""
volout=$($HOME/.bin/volume)

if [[ "${volout}" != "MUTE" ]]; then
  outstr="${outstr}⮞ "
else
  outstr="${outstr}⮝ "
  volout="mute"
fi

outstr="%{F{{ n_red }} }"${outstr}"%{F{{ bgc }} }"${volout}


echo "  "${outstr}"  "
