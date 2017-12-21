#!/bin/sh
sed -i \
         -e 's/#11141c/rgb(0%,0%,0%)/g' \
         -e 's/#cccccc/rgb(100%,100%,100%)/g' \
    -e 's/#0d1019/rgb(50%,0%,0%)/g' \
     -e 's/#16adac/rgb(0%,50%,0%)/g' \
     -e 's/#ffffff/rgb(50%,0%,50%)/g' \
     -e 's/#1a2139/rgb(0%,0%,50%)/g' \
	$@
