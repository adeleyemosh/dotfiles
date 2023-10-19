## Copyright (C) 2023 [Github] <https://github.com/adeleyemosh>

#  __  __  ____   _____ _    _
# |  \/  |/ __ \ / ____| |  | |
# | \  / | |  | | (___ | |__| |
# | |\/| | |  | |\___ \|  __  |
# | |  | | |__| |____) | |  | |
# |_|  |_|\____/|_____/|_|  |_|

# Theming for Qtile

import json
import os

def colors_config(file_path):
    with open(file_path) as f:
        return json.load(f)




# def load_theme():
#     theme = "onedark"
#     # qdir = os.path.expanduser('~/.config/qtile')

#     config_file = os.path.join(qdir, "config.json")
#     if os.path.isfile(config_file):
#         with open(config_file) as f:
#             theme = json.load(f).get("theme", theme)
#     else:
#         with open(config_file, "w") as f:
#             json.dump({"theme": theme}, f)

#     theme_file = os.path.join(qdir, "themes", f"{theme}.json")
#     if not os.path.isfile(theme_file):
#         raise Exception(f'"{theme_file}" does not exist')

#     with open(theme_file) as f:
#         return json.load(f)

# colors = load_theme()