#!/bin/bash
#  _____ _                                       _ _       _
# |_   _| |__   ___ _ __ ___   ___  _____      _(_) |_ ___| |__   ___ _ __
#   | | | '_ \ / _ \ '_ ` _ \ / _ \/ __\ \ /\ / / | __/ __| '_ \ / _ \ '__|
#   | | | | | |  __/ | | | | |  __/\__ \\ V  V /| | || (__| | | |  __/ |
#   |_| |_| |_|\___|_| |_| |_|\___||___/ \_/\_/ |_|\__\___|_| |_|\___|_|
#
# by Stephan Raabe (2024)
# -----------------------------------------------------

# -----------------------------------------------------
# Default theme folder
# -----------------------------------------------------
themes_path="$HOME/.config/waybar/themes"

# -----------------------------------------------------
# Initialize arrays
# -----------------------------------------------------
listThemes=""
listNames=""
listNames2=""

# -----------------------------------------------------
# Read theme folder
# -----------------------------------------------------
sleep 0.2
options=$(find "$themes_path" -maxdepth 2 -type d)
for value in $options; do
    if [ "$value" != "$themes_path/assets" ] && [ "$value" != "$themes_path" ]; then
        if [ -f "$value/config" ] && [ -f "$value/config.sh" ]; then
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
choice=$(echo -e "$listNames" | rofi -dmenu -replace -i -config ~/.config/rofi/config-themes.rasi -no-show-icons -width 30 -p "Themes" -format i)
IFS="~"
input=$listNames2
read -ra array <<<"$input"

# -----------------------------------------------------
# Set new theme by writing the theme information to ~/.config/ml4w/settings/waybar-theme.sh
# -----------------------------------------------------
if [ "$choice" ]; then
    echo "Loading waybar theme..."
    echo "${listThemes[$choice + 1]}" >~/.config/ml4w/settings/waybar-theme.sh
    ~/.config/waybar/assets/scripts/launch.sh
    notify-send "Waybar Theme changed" "to ${array[$choice]}"
fi
