## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

## Layouts
import os
from libqtile import layout
from libqtile.config import Match
from .theme import colors_config

## Layouts ------------------------------
active_section_color = '#E23E57'
normal_section_color = '#18232c'
border_width_var = 2
margin_var = [5,5,5,5]

layout_conf = {
    'border_focus': active_section_color,
    'border_normal':normal_section_color,
    'border_width': border_width_var,
}

layouts = [
	# This layout divides the screen into a matrix of equally sized cells and places one window in each cell.
    layout.Matrix(
        **layout_conf,
		columns=2,
		margin=margin_var
    ),

	# Maximized layout
    layout.Max(
		**layout_conf,
		margin=0
    ),

	# Emulate the behavior of XMonad's default tiling scheme.
    layout.MonadTall(
        **layout_conf,
		align=0,
		change_ratio=0.05,
		change_size=20,
		margin=0,
		max_ratio=0.75,
		min_ratio=0.25,
		min_secondary_size=85,
		new_client_position='after_current',
		ratio=0.5,
		single_border_width=None,
		single_margin=None
    ),

	# Emulate the behavior of XMonad's ThreeColumns layout.
    layout.MonadThreeCol(
        **layout_conf,
		align=0,
		change_ratio=0.05,
		change_size=20,
		main_centered=True,
		margin=0,
		max_ratio=0.75,
		min_ratio=0.25,
		min_secondary_size=85,
		new_client_position='top',
		ratio=0.5,
		single_border_width=None,
		single_margin=None
    ),

	# Emulate the behavior of XMonad's horizontal tiling scheme.
    layout.MonadWide(
        **layout_conf,
		align=0,
		change_ratio=0.05,
		change_size=20,
		margin=0,
		max_ratio=0.75,
		min_ratio=0.25,
		min_secondary_size=85,
		new_client_position='after_current',
		ratio=0.5,
		single_border_width=None,
		single_margin=None
    ),

	# A layout composed of stacks of windows
    layout.Stack(
        **layout_conf,
		autosplit=False,
		fair=False,
		margin=margin_var,
		num_stacks=2
    ),

	# A layout with two stacks of windows dividing the screen
    layout.Tile(
        **layout_conf,
		add_after_last=False,
		add_on_top=True,
		border_on_single=False,
		expand=True,
		margin=margin_var,
		margin_on_single=None,
		master_length=1,
		master_match=None,
		max_ratio=0.85,
		min_ratio=0.15,
		ratio=0.618,
		ratio_increment=0.05,
		shift_windows=False
    ),

	# Floating layout, which does nothing with windows but handles focus order
    layout.Floating(
        **layout_conf,
		fullscreen_border_width=0,
		max_border_width=0
	)
]

# The default floating layout to use. This allows you to set custom floating rules among other things if you wish.
floating_layout = layout.Floating(
	# **layout_conf,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="alacritty-float|Music"),
        Match(wm_class="Lxappearance|Nitrogen"),
        Match(wm_class="Pavucontrol|Xfce4-power-manager-settings|Nm-connection-editor"),
        Match(wm_class="feh|Viewnior|Gpicview|Gimp|MPlayer|Vlc|Spotify"),
        Match(wm_class="Kvantum Manager|qt5ct"),
        Match(wm_class="VirtualBox Manager|qemu|Qemu-system-x86_64"),
        Match(title="branchdialog"),
        Match(title="barrier"),
        Match(wm_class="flameshot"),
    ],
    border_focus=active_section_color
)