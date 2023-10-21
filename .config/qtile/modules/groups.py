## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

from libqtile.config import Key, Group
from libqtile.lazy import lazy
from .keys import mod, keys

groups = []
group_names = "123456789"
group_layouts = [
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall", 
    "monadtall",
]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
        ))

for i in groups:
    keys.extend(
        [
            # mod + number of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc=f"Switch to group {i.name}"),
            # mod + shift + number of group = switch to & move focused window to group
            Key(
                [mod, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            Key([mod], "Tab", lazy.screen.next_group(), desc="Switch to next group"),
            Key([mod, "shift"], "Tab", lazy.screen.prev_group(), desc="Switch to previous group"),
            Key(["mod1"], "Tab", lazy.screen.next_group(), desc="Switch to next group (Alt)"),
            Key(["mod1", "shift"], "Tab", lazy.screen.prev_group(), desc="Switch to previous group (Alt)"),
        ]
    )
