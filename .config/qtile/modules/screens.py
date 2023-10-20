## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger

## Screens ------------------------------

top_gap = 5
bottom_gap = 5
left_gap = 5
right_gap = 5

# Any third-party statusbar (polybar) with Gaps
screens = [
    Screen(
        right=bar.Gap(right_gap),
        left=bar.Gap(left_gap),
        bottom=bar.Gap(bottom_gap),
        top=bar.Gap(top_gap)
    )
]