#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#0c1015/g' \
         -e 's/rgb(100%,100%,100%)/#abb2bf/g' \
    -e 's/rgb(50%,0%,0%)/#0c1015/g' \
     -e 's/rgb(0%,50%,0%)/#ECB267/g' \
 -e 's/rgb(0%,50.196078%,0%)/#ECB267/g' \
     -e 's/rgb(50%,0%,50%)/#070d13/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#070d13/g' \
     -e 's/rgb(0%,0%,50%)/#ffffff/g' \
	$@
