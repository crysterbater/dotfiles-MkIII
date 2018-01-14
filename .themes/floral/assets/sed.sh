#!/bin/sh
sed -i \
         -e 's/#1a1e24/rgb(0%,0%,0%)/g' \
         -e 's/#abb2bf/rgb(100%,100%,100%)/g' \
    -e 's/#151b26/rgb(50%,0%,0%)/g' \
     -e 's/#6398cf/rgb(0%,50%,0%)/g' \
     -e 's/#0a0f14/rgb(50%,0%,50%)/g' \
     -e 's/#ffffff/rgb(0%,0%,50%)/g' \
	$@
