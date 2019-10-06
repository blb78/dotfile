#!/bin/bash
state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "state" | sed -e 's/state\://g' -e 's/^[[:space:]]*//' -e '/^$/d'`
percentage=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "percentage" | sed -e 's/percentage\://g' -e 's/^[[:space:]]*//' -e '/^$/d'`
value=$(sed 's/%//g' <<< $percentage)
if (( $value < 10 )); then
	dunstify -u critical "$state" "$percentage"
else
	dunstify -u normal "$state" "$percentage"
fi
