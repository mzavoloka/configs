#!/bin/bash

# Unsetting stupid shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F1'  -r # reset workspace_1_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F2'  -r # reset workspace_2_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F3'  -r # reset workspace_3_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F4'  -r # reset workspace_4_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F5'  -r # reset workspace_5_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F6'  -r # reset workspace_6_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F8'  -r # reset workspace_8_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F10' -r # reset workspace_10_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F11' -r # reset workspace_11_key
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F12' -r # reset workspace_12_key


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

xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>F7'  -r # reset old 'maximize_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/default/<Alt>F7' -r # reset old 'maximize_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Up' -t string -s 'maximize_window_key'

xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>F9'  -r # reset old 'hide_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/default/<Alt>F9' -r # reset old 'hide_window_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Down' -t string -s 'hide_window_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Left' -t string -s 'tile_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Right' -t string -s 'tile_right_key'

xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Left' -r # reset old 'move_window_left_workspace_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Shift><Alt>Left' -t string -s 'move_window_left_workspace_key'
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Right' -r # reset old 'move_window_right_workspace_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Shift><Alt>Right' -t string -s 'move_window_right_workspace_key'