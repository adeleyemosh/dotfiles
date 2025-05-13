#!/bin/bash

# Fetch Hyprland active window info
info=$(hyprctl activewindow -j 2>/dev/null)

# If no active window (empty desktop), exit silently
[ -z "$info" ] && echo "" && exit 0

# Extract title and class
title=$(echo "$info" | jq -r '.title')
class=$(echo "$info" | jq -r '.class')

# Icon map (extend this as you wish)
case "$class" in
  "Geany") icon="📝" ;;
  "Ferdium") icon="💬" ;;
  "kitty") icon="" ;;
  "firefox") icon="" ;;
  "Code" | "code") icon="󰨞" ;;
  "discord") icon="󰙯" ;;
  "thunar" | "nautilus") icon="" ;;
  *) icon="" ;;  # Fallback icon
esac

# Truncate title to max length
max_length=60
if [ ${#title} -gt $max_length ]; then
  title="${title:0:$max_length}…"
fi

# Output for waybar
echo "$icon $title"
