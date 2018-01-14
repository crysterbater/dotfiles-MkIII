#!/bin/sh
sed -i \
         -e 's/#ffffff/rgb(0%,0%,0%)/g' \
         -e 's/#383e42/rgb(100%,100%,100%)/g' \
    -e 's/#070d13/rgb(50%,0%,0%)/g' \
     -e 's/#fcfcfc/rgb(0%,50%,0%)/g' \
     -e 's/#0e1219/rgb(50%,0%,50%)/g' \
     -e 's/#f2f4f4/rgb(0%,0%,50%)/g' \
	$@
