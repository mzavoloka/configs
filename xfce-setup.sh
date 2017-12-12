#!/bin/bash

# Setting new shortcuts

# commands
xfconf-query -c xfce4-keyboard-shortcuts -np '/commands/custom/<Super>W' -t string -s 'xfce4-appfinder'
xfconf-query -c xfce4-keyboard-shortcuts -np '/commands/custom/<Primary><Super>L' -t string -s 'xflock4'

# window management
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>d' -t string -s 'show_desktop_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>1' -t string -s 'tile_up_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>2' -t string -s 'tile_up_right_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>3' -t string -s 'tile_down_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>4' -t string -s 'tile_down_right_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>5' -t string -s 'tile_up_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>6' -t string -s 'tile_down_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Up' -t string -s 'maximize_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Down' -t string -s 'hide_window_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Left' -t string -s 'tile_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Right' -t string -s 'tile_right_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Shift><Alt>Left' -t string -s 'move_window_left_workspace_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Shift><Alt>Right' -t string -s 'move_window_right_workspace_key'
