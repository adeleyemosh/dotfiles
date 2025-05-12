#!/bin/bash

export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    STATE="Muted"
    ICON="$HOME/.local/share/icons/dunst/volume-mute.svg"
else
    STATE="Volume"
    if [ "$VOLUME" -lt 33 ]; then
        ICON="$HOME/.local/share/icons/dunst/volume-low.svg"
    elif [ "$VOLUME" -lt 66 ]; then
        ICON="$HOME/.local/share/icons/dunst/volume-medium.svg"
    else
        ICON="$HOME/.local/share/icons/dunst/volume-high.svg"
    fi
fi

notify-send "$STATE" "${VOLUME}% volume" -u normal -i "$ICON" -t 4000 -r 9992

paplay /usr/share/sounds/freedesktop/stereo/bell.oga &
