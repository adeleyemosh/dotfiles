#!/bin/bash

# -----------------------------------------------------
# EWW Theme Launcher - Fixed for adi theme
# -----------------------------------------------------

CONFIG_DIR="$HOME/.config/eww/desktop-widget-theme"
SETTINGS_PATH="$HOME/.config/ml4w/settings"
STATE_FILE="$SETTINGS_PATH/eww-launch.active"
THEME_CONFIG="$SETTINGS_PATH/eww-theme.sh"
DEFAULT_THEME="adi"

mkdir -p "$SETTINGS_PATH"

# Determine selected theme
if [[ -f "$THEME_CONFIG" ]]; then
  THEME_NAME="$(cat "$THEME_CONFIG" | xargs)"
else
  THEME_NAME="$DEFAULT_THEME"
fi

CFG="$CONFIG_DIR/$THEME_NAME"
EWW=$(which eww)

# Validate theme directory
if [[ ! -d "$CFG" ]]; then
  notify-send "Eww Error" "Theme folder not found: $CFG"
  exit 1
fi

# Kill any existing Eww
pkill eww
sleep 0.5
$EWW --config "$CFG" daemon &
sleep 0.5

# Get current resolution
RES="$(xdpyinfo | awk '/dimensions:/ {print $2}')"
WINDOWS=()

# Main yuck file
MAIN_YUCK="$CFG/eww.yuck"
# Resolution-specific file
RES_YUCK="$CFG/windows/$RES.yuck"

# Create a temporary combined yuck file
TEMP_YUCK="$CFG/.eww-combined.yuck"
cp "$MAIN_YUCK" "$TEMP_YUCK"

# Append resolution-specific content if exists
if [[ -f "$RES_YUCK" ]]; then
  echo "" >> "$TEMP_YUCK"
  cat "$RES_YUCK" >> "$TEMP_YUCK"
fi

# Extract all window names from the combined file
WINDOWS=$(grep -oP '(?<=\(defwindow )\S+' "$TEMP_YUCK" | sort -u)

# Final check and launch
if [[ -z "$WINDOWS" ]]; then
  notify-send "Eww Error" "No windows found for theme: $THEME_NAME"
  rm -f "$TEMP_YUCK"
  exit 1
fi

# Open all detected windows
$EWW --config "$CFG" open-many $WINDOWS
echo "$THEME_NAME" > "$STATE_FILE"
notify-send "Eww Theme Applied" "$THEME_NAME loaded successfully"

# Clean up temporary file after delay
(sleep 50; rm -f "$TEMP_YUCK") &
