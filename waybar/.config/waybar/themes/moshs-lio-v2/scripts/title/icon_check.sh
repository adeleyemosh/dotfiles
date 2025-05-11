#!/bin/bash

app_name=$(hyprctl activewindow | grep -oP 'class: \K[^\s]+')

if [ -z "$app_name" ]; then
  echo "No active window"
  exit 0
fi

# Map app class to icon
case "$app_name" in
  "kitty") icon="" ;;
  "Geany") icon="📝" ;;
  "firefox") icon="" ;;
  "code" | "Code") icon="󰨞" ;;
  "discord") icon="󰙯" ;;
  "thunar" | "nautilus") icon="" ;;
  *) icon="" ;; # fallback icon
esac

echo "App: $app_name"
echo "Icon: $icon"
