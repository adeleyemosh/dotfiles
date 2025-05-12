#!/bin/bash

export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BRIGHTNESS=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$((BRIGHTNESS * 100 / MAX))
ICON="$HOME/.local/share/icons/dunst/brightness.svg"

notify-send "Brightness" "${PERCENT}% brightness" -u normal -i "$ICON" -t 4000 -r 9993
