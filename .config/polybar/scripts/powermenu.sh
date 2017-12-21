
res=$(echo "locate|files|themes|clipboard|network|define|scrot|gallery" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -auto-select)

function sure {
  local res=$(echo "no|yes" | rofi -sep "|" -dmenu -i -p "$1: sure?" -auto-select)
  [[ $res = "yes" ]] && exec $2
}

[[ $res = "locate" ]]   && rofi-locate
[[ $res = "colorschemes" ]]   && rofi -modi colorscheme:rofi-colorscheme-switch  -show colorscheme:rofi-colorscheme-switch
[[ $res = "themes" ]]      && rofi-theme-selector 
[[ $res = "clipboard" ]]    && rofi-clipboard
[[ $res = "network" ]]    && network.py
[[ $res = "websearch" ]]    && rofi-web-search
[[ $res = "scrot" ]] && sshot.py
[[ $res = "gallery" ]] && screenshots.py

exit 0
