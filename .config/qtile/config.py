## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

from libqtile import hook

from modules.keys import mod, keys
from modules.groups import groups
from modules.layouts import layouts, floating_layout
from modules.mouse import mouse
from modules.screens import screens
from modules.hooks import *

import os
import subprocess

# Startup ------------------------------
# @hook.subscribe.startup_once
# def autostart():
#     home = os.path.expanduser('~')
#     subprocess.Popen([home + '/.config/qtile/scripts/qtile_autostart'])

# Default settings for bar widgets.
widget_defaults = dict(
    font='JetBrainsMono Nerd Font',
    fontsize=14,
    padding=5,
)

## General Configuration Variables ------------------------------
auto_fullscreen = True
bring_front_click = False
cursor_warp = False
dgroups_key_binder = None
dgroups_app_rules = [] 
focus_on_window_activation = "smart"
follow_mouse_focus = True
extension_defaults = widget_defaults.copy()
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
