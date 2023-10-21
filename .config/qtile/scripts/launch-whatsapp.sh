#!/bin/bash

## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>
#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|
# -----------------------------------------------------

echo "Starting WhatsApp..."

# -----------------------------------------------------
# Launch WhatsApp
# -----------------------------------------------------
# Change directory to the script's location
cd ~/WhatsAppWeb-linux-x64/

# Run WhatsApp
./WhatsAppWeb


# -----------------------------------------------------
# Send notification
# -----------------------------------------------------
notify-send "WhatsApp Web"

echo "Done."
