!# /bin/bash
exec xrandr --output DP1 --off &
# Get list of connected monitors
x_out=$(xrandr -q | grep -e '\( \)connected' | awk -F' ' '{ print $1 }')
# Safety - Check if PRIMARY_DISPLAY is connected; if not, bail out of script
[[ $(grep "DP1" <<< ${x_out}) ]] || exit 0
exec xrandr --output DP1 --auto --right-of eDP1 --primary
