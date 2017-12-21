#!/bin/sh

# The USB symbol from ttf-font-awesome
sym=""
# The default directory
dir="/run/media"

if [ $# -ne 0 ]; then
  dir="${1%/}"
fi

for f in `ls $dir`; do
  # Outputs the size of the filesystem. 'avail' outputs available space,
  # it can be changed for 'size', 'used'... See man df for more information.
  size=`df --output=avail -h $dir/$f | tail -1`
  size="${size:1}B"
  res="$res$sym ($size)  "
done

echo "${res%*  }"