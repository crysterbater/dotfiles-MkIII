#!/usr/bin/env fish
#
set color "%{B{{ fgc }} }"
set fgc "%{F{{ bgc }} }"
set freset "%{F{{ bgc }} }"
set reset "%{B{{ fgc }} }"
set icon ⮛
pkill -f xtitle

xtitle -s | while read window
		echo $color$fgc"     $icon $window      "$reset$freset| sed 's/fish //'
end

