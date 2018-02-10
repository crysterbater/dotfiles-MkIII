erc
res=$(echo "locate|google|history|Kill|" | rofi -sep "|" -dmenu -i -p 'rofi shit: ' "" -auto-select)

function sure {
  local res=$(echo "no|yes" | rofi -sep "|" -dmenu -i -p "$1: sure?" -auto-select)
  [[ $res = "yes" ]] && exec $2
}

[[ $res = "locate" ]]      && /home/dead/.scripts/rofi-locate
[[ $res = "google" ]]   && /home/dead/.scripts/google_dmenu
[[ $res = "history" ]]  && /home/dead/bin/rofi/rofi_scripts/rofi-history
[[ $res = "Kill" ]]  && rofi_kill_process.sh

exit 0
