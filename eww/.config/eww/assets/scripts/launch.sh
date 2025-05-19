#!/bin/bash

# -----------------------------------------------------
# EWW Theme launcher script
# by Moshood Adeleye (2025)
# -----------------------------------------------------

# Kill any running eww windows and clear cache
pkill eww
sleep 0.3

# -----------------------------------------------------
# Get selected theme from config file
# -----------------------------------------------------
theme_config="$HOME/.config/ml4w/settings/eww-theme.sh"

# Fallback default
default_theme="/adi"

# Check and load
if [ -f "$theme_config" ]; then
    theme_path=$(cat "$theme_config")
else
    theme_path="$default_theme"
fi

# Extract theme folder name from path
IFS=';' read -ra arr <<< "$theme_path"
theme="${arr[0]##*/}"   # e.g., sai, gross

# -----------------------------------------------------
# Execute theme's launcher script
# -----------------------------------------------------
launcher="$HOME/.config/eww/desktop-widget-theme/$theme/launch_$theme"

if [ -f "$launcher" ]; then
    chmod +x "$launcher"
    "$launcher"
else
    notify-send "Eww Theme Error" "Launcher not found for theme '$theme'"
    echo "❌ No launcher script found at $launcher"
fi

