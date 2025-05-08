#!/bin/bash
# stowify.sh — A utility to restructure dotfiles into GNU Stow-compatible format
# Author: Moshood Adeleye (Mosh)
# GitHub: https://github.com/adeleyemosh/dotfiles
# Description: Converts a monolithic or ML4W-style dotfiles setup into a stow-ready modular structure.

set -e

# Set the base dotfiles directory (relative or absolute)
DOTFILES_DIR="$HOME/dotfiles"

# Target location of configs inside dotfiles (e.g., .bashrc, .config/nvim, etc.)
CONFIG_PATH="$DOTFILES_DIR/config/.config"

# List of .config folders to stowify
CONFIG_FOLDERS=(
  gtk-3.0 gtk-4.0
  fastfetch ohmyposh
  nvim kitty alacritty rofi swaync
  waybar wal xsettingsd
  hypr dunst ml4w nwg-dock-hyprland qt6ct
  bashrc vim waypaper wlogout zshrc
)

# Map of top-level dotfiles to their stow package folder
declare -A DOTFILE_MAP=(
  [".zshrc"]=zsh
  [".bashrc"]=bash
  [".gtkrc-2.0"]=gtk
  [".Xresources"]=x11
)

# Function to move a .config subfolder into a stow package
stowify_config_folder() {
  local folder="$1"
  echo "Processing config folder: $folder"
  mkdir -p "$DOTFILES_DIR/$folder/.config"
  mv "$CONFIG_PATH/$folder" "$DOTFILES_DIR/$folder/.config/"
}

# Function to move a top-level dotfile into its mapped package
stowify_dotfile() {
  local file="$1"
  local folder="${DOTFILE_MAP[$file]}"
  echo "Processing dotfile: $file into $folder"
  mkdir -p "$DOTFILES_DIR/$folder"
  if [ -f "$DOTFILES_DIR/$file" ]; then
    mv "$DOTFILES_DIR/$file" "$DOTFILES_DIR/$folder/$file"
  fi
}

# Main logic
cd "$DOTFILES_DIR"

# Process .config subfolders
for folder in "${CONFIG_FOLDERS[@]}"; do
  if [ -d "$CONFIG_PATH/$folder" ]; then
    stowify_config_folder "$folder"
  fi
done

# Process individual dotfiles
for df in "${!DOTFILE_MAP[@]}"; do
  if [ -f "$DOTFILES_DIR/$df" ]; then
    stowify_dotfile "$df"
  fi
done

# Optional: Remove original config folder if empty
if [ -d "$CONFIG_PATH" ] && [ -z "$(ls -A $CONFIG_PATH)" ]; then
  echo "Removing empty: $CONFIG_PATH"
  rm -r "$DOTFILES_DIR/config"
fi

# Summary
echo "✅ Dotfiles successfully restructured for stow."
echo "Use 'stow <package>' from inside $DOTFILES_DIR to symlink."
