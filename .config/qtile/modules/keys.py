## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

# Qtile keybindings

from libqtile.config import Key
from libqtile.config import KeyChord
from libqtile.lazy import lazy

import os

mod = "mod4"


# Scripts/Apps Variables
home         = os.path.expanduser('~')
# terminal     = 'alacritty'
terminal     = home + '/.config/qtile/scripts/qtile_term'
music_player = home + '/.config/qtile/scripts/qtile_music'
color_picker = home + '/.config/qtile/scripts/qtile_colorpicker'
brightness   = home + '/.config/qtile/scripts/brightnesscontrol'
volume       = home + '/.config/qtile/scripts/qtile_volume'
screenshot   = home + '/.config/qtile/scripts/qtile_screenshot'
file_manager = 'thunar'
text_editor  = 'kate'
web_browser  = 'firefox'
alacritty    = 'alacritty --config-file ' + home + '/.config/qtile/alacritty/alacritty.yml'
rofi_applets = home + '/.config/qtile/scripts/'
notify_cmd   = 'dunstify -u low -h string:x-dunst-stack-tag:qtileconfig'

keys = [
    # ------------ Window Configs ------------
    # WM Specific --
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    
    # Control Qtile
    Key([mod, "control"], "r", lazy.reload_config(), lazy.spawn(notify_cmd + ' "Configuration Reloaded!"'), desc="Reload the config"),
    Key([mod, "control"], "s", lazy.restart(), lazy.spawn(notify_cmd + ' "Restarting Qtile..."'), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), lazy.spawn(notify_cmd + ' "Exiting Qtile..."'), desc="Shutdown Qtile"),
    
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "Return", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle floating and fullscreen
    Key([mod], "space", lazy.window.toggle_floating(), desc="Put the focused window to/from floating mode"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Put the focused window to/from fullscreen mode"),

    # Go to next/prev group
    Key([mod, "mod1"], "Right", lazy.screen.next_group(), desc="Move to the group on the right"),
    Key([mod, "mod1"], "Left", lazy.screen.prev_group(), desc="Move to the group on the left"),

    # Back-n-forth groups
    Key([mod], "b", lazy.screen.toggle_group(), desc="Move to the last visited group"),

    # Change focus to other window
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "space", lazy.next_layout(), desc="Toggle between layouts"),

    # Increase the space for master window at the expense of slave windows
    Key([mod], "equal", lazy.layout.increase_ratio(), desc="Increase the space for master window"),

    # Decrease the space for master window in the advantage of slave windows
    Key([mod], "minus", lazy.layout.decrease_ratio(), desc="Decrease the space for master window"),

    # Toggle between split and unsplit sides of stack.
    Key([mod, "shift"], "s", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # ------------ App Configs ------------
    # Terminal --
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal with qtile configs"),
    Key([mod, "shift"], "Return", lazy.spawn(terminal + ' --float'), desc="Launch floating terminal with qtile configs"),
    Key([mod, "mod1"], "Return", lazy.spawn(terminal + ' --full'), desc="Launch fullscreen terminal with qtile configs"),
    
    # GUI Apps --
    Key([mod, "shift"], "f", lazy.spawn(file_manager), desc="Launch file manager"),
    Key([mod, "shift"], "e", lazy.spawn(text_editor), desc="Launch text editor"),
    Key([mod, "shift"], "w", lazy.spawn(web_browser), desc="Launch web browser"),
    
    # CLI Apps --
    Key(["control", "mod1"], "v", lazy.spawn(alacritty + ' -e vim'), desc="Open vim in qtile's terminal"),
    Key(["control", "mod1"], "r", lazy.spawn(alacritty + ' -e ranger'), desc="Open ranger in qtile's terminal"),
    Key(["control", "mod1"], "h", lazy.spawn(alacritty + ' -e htop'), desc="Open htop in qtile's terminal"),
    Key(["control", "mod1"], "m", lazy.spawn(music_player), desc="Open ncmpcpp in qtile's terminal"),
    
    # Rofi Applets --
    Key(["mod1"], "F1", lazy.spawn(rofi_applets + 'rofi_launcher'), desc="Run application launcher"),
    Key(["mod1"], "F2", lazy.spawn(rofi_applets + 'rofi_runner'), desc="Run command runner"),
    Key([mod], "n", lazy.spawn(rofi_applets + 'network_menu'), desc="Run network manager applet"),
    Key([mod], "x", lazy.spawn(rofi_applets + 'rofi_powermenu'), desc="Run powermenu applet"),
    Key([mod], "m", lazy.spawn(rofi_applets + 'rofi_music'), desc="Run music player applet"),
    Key([mod], "r", lazy.spawn(rofi_applets + 'rofi_asroot'), desc="Run asroot applet"),
    Key([mod], "s", lazy.spawn(rofi_applets + 'rofi_screenshot'), desc="Run screenshot applet"),
    Key([mod], "t", lazy.spawn(rofi_applets + 'rofi_themes'), desc="Run themes applet"),

    # ------------ Hardware Configs ------------
    # Function keys : Brightness --
    Key([], "XF86MonBrightnessUp", lazy.spawn(brightness + ' --inc'), desc="Increase display brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(brightness + ' --dec'), desc="Decrease display brightness"),
    
    # Function keys : Volume --
    Key([], "XF86AudioRaiseVolume", lazy.spawn(volume + ' --inc'), desc="Raise speaker volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(volume + ' --dec'), desc="Lower speaker volume"),
    Key([], "XF86AudioMute", lazy.spawn(volume + ' --toggle'), desc="Toggle mute"),
    Key([], "XF86AudioMicMute", lazy.spawn(volume + ' --toggle-mic'), desc="Toggle mute for mic"),
    
    # -------------- Miscellaneous -------------
    # Misc --
    Key([mod], "p", lazy.spawn(color_picker), desc="Run colorpicker"),
    Key(["mod1", "control"], "l", lazy.spawn("betterlockscreen --lock"), desc="Run lockscreen"),
    
    # # Modes: Reize
    # KeyChord([mod, "shift"], "r", [
    #     Key([], "Left", lazy.layout.grow_left()),
    #     Key([], "Right", lazy.layout.grow_right()),
    #     Key([], "Down", lazy.layout.grow_down()),
    #     Key([], "Up", lazy.layout.grow_up())],
    #     mode=True,
    #     name="Resize"
    # ),

	# # Modes: Layouts
    # KeyChord([mod, "shift"], "l", [
    #     Key([], "Left", lazy.prev_layout()),
    #     Key([], "Right", lazy.next_layout())],
    #     mode=True,
    #     name="Layouts"
    # )
]