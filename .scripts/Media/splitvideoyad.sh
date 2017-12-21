#! /bin/bash

eval RES=($(yad --form --quoted-output --separator=" " --field "Input file:FL" --field "Output dir:DIR" --field "Duration:NUM"))
[[ $? -ne 0 ]] && exit 1

ext=${RES[0]##*.}
out=$(basename ${RES[0]} .$ext)

$mkdir "${RES[2]}"
ffmpeg -i "${RES[0]}" -f segment -segment_time "${RES[2]}" -acodec copy -vcodec copy -reset_timestamps 1 -map 0 "${RES[1]}/$out-%d
