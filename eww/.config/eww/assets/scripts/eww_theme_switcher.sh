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

# -----------------------------------------------------
# Initialize arrays
# -----------------------------------------------------
listThemes=""
listNames=""
listNames2=""

# -----------------------------------------------------
# Read theme folders
# -----------------------------------------------------
sleep 0.2
options=$(find "$themes_path" -maxdepth 2 -type d)
for value in $options; do
    if [ "$value" != "$themes_path" ]; then
        if [ -f "$value/eww.yuck" ] && [ -f "$value/config.sh" ]; then
            result=$(echo "$value" | sed "s#$themes_path/#/#g")
            IFS='/' read -ra arrThemes <<<"$result"
            listThemes[${#listThemes[@]}]="/${arrThemes[1]};$result"
            source "$themes_path$result/config.sh"
            listNames+="$theme_name\n"
            listNames2+="$theme_name~"
        fi
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
    echo "Loading Eww widget theme..."
    echo "${listThemes[$choice + 1]}" > ~/.config/ml4w/settings/eww-theme.sh
    ~/.config/eww/assets/scripts/launch.sh
    notify-send "Eww Theme changed" "to ${array[$choice]}"
fi
