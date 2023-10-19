## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

## Mouse
from libqtile.config import Click, Drag
from libqtile.lazy import lazy
from .keys import mod

# Drag floating layouts.
mouse = [
    Drag(
        [mod], 
        "Button1", 
        lazy.window.set_position_floating(), 
        start=lazy.window.get_position()
    ),
    Drag(
        [mod], 
        "Button3", 
        lazy.window.set_size_floating(), 
        start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]