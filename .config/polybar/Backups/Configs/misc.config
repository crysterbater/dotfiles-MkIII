;=====================================================
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;=====================================================

[colors]
background = #070015
background-alt = #444
foreground = #00B7B6
foreground-alt = #555555
primary = #620598
secondary = #e60053
underline = #3288D2
alert = #bd2c40

[global/wm]
margin-top = 5
margin-bottom = 5

;------------------------
[bar/left]
monitor = ${env:MONITOR:eDP1}
width = 100%
height = 23
offset-x = 0
offset-y = 0

background = ${colors.background}
foreground = ${colors.foreground}

overline-size = 2
overline-color = #f00
underline-size = 2
;underline-color = ${colors.primary}

border-bottom = 3
;border-bottom-color = ${colors.primary}

spacing = 2
padding-left = 2
padding-right = 2
module-margin-left = 2
module-margin-right = 2

font-0 = fixed:pixelsize=10;0
font-1 = Inconsolata-g:size=12:heavy:fontformat=truetype;-2
font-2 = Inconsolata-g:pixelsize=10;0
font-3 = FontAwesome:pixelsize=10;0

modules-left = i3 mpd
modules-center = date
modules-right = battery backlight volume 

; PROBLEM WITH NETWORK MPD

tray-position = right
tray-padding = 2
;tray-transparent = true
;tray-background = #0063ff

wm-restack = i3

;override-redirect = true


scroll-up = i3wm-wsnext
scroll-down = i3wm-wsprev
pin-workspaces = true
enable-click = false
enable-scroll = false

;------------------------------
[bar/right]
monitor = ${env:MONITOR:DP1}
width = 100%
height = 23
offset-x = 0
offset-y = 0

;background = ${xrdb:color9}
background = ${colors.background}
foreground = ${colors.foreground}

overline-size = 2
overline-color = #f00
underline-size = 2
;underline-color = ${colors.primary}

border-bottom = 3
;border-bottom-color = ${colors.primary}

spacing = 2
padding-left = 2
padding-right = 2
module-margin-left = 2
module-margin-right = 2

font-0 = fixed:pixelsize=9;0
font-1 = unifont:size=9:heavy:fontformat=truetype;-2
font-2 = Inconsolata-g:pixelsize=10;0
font-3 = FontAwesome:pixelsize=10;0

modules-left = i3
modules-center = date
modules-right = volume

;tray-position = right
;tray-padding = 2
;tray-transparent = true
;tray-background = #0063ff

wm-restack = i3

scroll-up = i3wm-wsnext
scroll-down = i3wm-wsprev
pin-workspaces = true
enable-click = false
enable-scroll = false

;---------------------------------------------------------

[module/xwindow]
type = internal/xwindow
label = %title:0:30:...%
format-underline = ${colors.underline}

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ${colors.primary}

label-focused = %name%
label-focused-foreground = $(colors.underline)
label-focused-background = ${colors.primary}
;label-focused-underline = ${colors.primary}
label-focused-padding = 2

label-unfocused = %name%
label-unfocused-padding = 2

label-urgent = %name%!
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

label-visible = %name%
label-visible-background = ${colors.background}
;label-visible-underline = #383a3b
label-visible-padding = ${self.label-focused-padding}

[module/backlight]
type = internal/xbacklight

output = eDP1

format = <label> <bar>
label = light



bar-width = 10
bar-indicator = │
bar-indicator-foreground = #ff
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = #9f78e1
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ${colors.foreground-alt}




[module/date]
type = internal/date
interval = 1

date = " %a, %d %B "
time = "%H:%M:%S "

format-prefix-foreground = ${colors.background}
;format-background = ${colors.primary}
format-foreground = ${colors.foreground}
format-underline = ${colors.underline}
label = "%date% %time%"




[module/volume]
type = internal/volume

format-volume = <label-volume><bar-volume>
label-volume = 
label-volume-foreground = ${root.foreground}

format-muted-prefix = " "
format-muted-foreground = ${colors.foreground-alt}
label-muted = MUTED

bar-volume-width = 12
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = │
bar-volume-indicator-font = 2
bar-volume-indicator-foreground = #ff
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC0
full-at = 99

format-charging = <animation-charging><label-charging>
;format-charging-underline = #ff5555

format-discharging = <ramp-capacity><label-discharging>
;format-discharging-underline = ${self.format-charging-underline}

format-full-prefix = 
format-full-prefix-foreground = ${colors.foreground}
;format-full-underline = ${self.format-charging-underline}

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 


animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-foreground = ${colors.foreground}
animation-charging-framerate = 750

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 80

format = <ramp><label>
;format-underline = #ff5555
format-warn = <ramp><label-warn>
;format-warn-underline = ${self.format-underline}

label = %temperature%
label-warn = %temperature%
label-warn-foreground = ${colors.secondary}

ramp-0 = 
ramp-1 = 
ramp-2 = 

[module/archupdates]
type = custom/script
interval = 1200
format = <label>
;format-underline = #ff5555
label = "%output:0:30%"
exec = .config/polybar/pkg.sh
exec-if = "ping -q -w 2 -c 1 176.34.135.167 > /dev/null"

[module/cpu]
type = internal/cpu
interval = 1
label =  %percentage%%
;format-underline = #ff5555


[module/mpd]
type = internal/mpd

host = 127.0.0.1
port = 6600
;password = mysecretpassword

; Seconds to sleep between progressbar/song timer sync
; Default: 1
interval = 2

format-online = <icon-prev> <icon-seekb> <icon-stop> <toggle> <icon-seekf> <icon-next>  <icon-repeat> <icon-random>  <bar-progress> <label-time>  <label-song>

label-song = 𝄞 %artist% - %album% -  %title%
label-time = %elapsed% / %total%
icon-play = ⏵
icon-pause = ⏸
icon-stop = ⏹
icon-prev = ⏮
icon-next = ⏭
icon-seekb = ⏪
icon-seekf = ⏩
icon-random = 🔀
icon-repeat = 🔁
icon-repeatone = 🔂
