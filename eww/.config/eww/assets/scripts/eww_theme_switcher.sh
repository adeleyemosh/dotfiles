#!/bin/bash
#  _____ _                                       _ _       _
# |_   _| |__   ___ _ __ ___   ___  _____      _(_) |_ ___| |__   ___ _ __
#   | | | '_ \ / _ \ '_ ` _ \ / _ \/ __\ \ /\ / / | __/ __| '_ \ / _ \ '__|
#   | | | | | |  __/ | | | | |  __/\__ \\ V  V /| | || (__| | | |  __/ |
#   |_| |_| |_|\___|_| |_| |_|\___||___/ \_/\_/ |_|\__\___|_| |_|\___|
#
# by Moshood Adeleye (2025)
# -----------------------------------------------------

# -----------------------------------------------------
# Default widget themes path for Eww
# -----------------------------------------------------
themes_path="$HOME/.config/eww/desktop-widget-theme"
settings_path="$HOME/.config/ml4w/settings"
mkdir -p "$settings_path"

# -----------------------------------------------------
# Initialize arrays
# -----------------------------------------------------
listThemes=()
listNames=""
listNames2=""

# -----------------------------------------------------
# Read theme folders
# -----------------------------------------------------
for dir in "$themes_path"/*; do
    [ -d "$dir" ] || continue
    if [ -f "$dir/eww.yuck" ]; then
        theme_name=$(basename "$dir")
        listThemes+=("$theme_name")
        listNames+="$theme_name\n"
        listNames2+="$theme_name~"
    fi
done

# -----------------------------------------------------
# Show rofi dialog
# -----------------------------------------------------
listNames=${listNames::-2}
choice=$(echo -e "$listNames" | rofi -dmenu -replace -i -config ~/.config/rofi/config-themes.rasi -no-show-icons -width 30 -p "Widgets" -format i)
IFS="~"
input=$listNames2
read -ra array <<<"$input"

# -----------------------------------------------------
# Set new theme
# -----------------------------------------------------
if [ "$choice" ]; then
    theme="${listThemes[$choice]}"
    echo "$theme" > "$settings_path/eww-theme.sh"
    ~/.config/eww/assets/scripts/launch.sh
    notify-send "Eww Theme Changed" "to $theme"
fi
