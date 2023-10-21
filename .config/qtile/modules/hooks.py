## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|


from libqtile import hook
import subprocess
import os

from .layouts import floating_types

# --------------------------------------------------------
# Hooks
# --------------------------------------------------------

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/scripts/qtile_autostart'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
        or window.window.get_wm_type() in floating_types):
        window.floating = True
