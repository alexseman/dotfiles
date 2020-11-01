#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9][0-9]?%')

# Full and short texts
echo "$BAT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#ff79c6"

exit 0
