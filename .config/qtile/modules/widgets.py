## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|


from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

font_name = 'JetBrainsMono Nerd Font'

# Default settings for bar widgets.
widget_defaults = dict(
    font=font_name,
    fontsize=14,
    padding=5,
)

# Same as `widget_defaults`, Default settings for extensions.
extension_defaults = widget_defaults.copy()