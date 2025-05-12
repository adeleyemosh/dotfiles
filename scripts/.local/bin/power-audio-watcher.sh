#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

inotifywait -m -e create /tmp | while read -r path action file; do
  case "$file" in
    "charger-plugged")
      notify-send "Charging" "Laptop is plugged in." -u normal -i "$HOME/.local/share/icons/dunst/battery-charging.png" -t 4000
      paplay /usr/share/sounds/freedesktop/stereo/power-plug.oga
      rm /tmp/charger-plugged
      ;;
    "charger-unplugged")
      notify-send "Discharging" "Charger removed." -u normal -i "$HOME/.local/share/icons/dunst/battery-discharging.png" -t 4000
      paplay /usr/share/sounds/freedesktop/stereo/power-unplug.oga
      rm /tmp/charger-unplugged
      ;;
  esac
done
