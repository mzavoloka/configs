#!/bin/bash

# Removing shortcuts that I don't use

# commands
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F1' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F2' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F2/startup-notify' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F3' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F3/startup-notify' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F3' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary><Alt>Delete' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>p' -r

# window management
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>F12' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>F6' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>F7' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>F8' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F1' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F2' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F3' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F4' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F5' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F6' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F7' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F8' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F9' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F10' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F11' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F12' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>Left' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>Right' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>d' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt><Shift>Left' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt><Shift>Right' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Left' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Right' -r


# Setting new shortcuts

# commands
xfconf-query -c xfce4-keyboard-shortcuts -np '/commands/custom/<Super>W' -t string -s 'xfce4-appfinder'
xfconf-query -c xfce4-keyboard-shortcuts -np '/commands/custom/<Primary><Super>L' -t string -s 'xflock4'

# window management
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>d' -t string -s 'show_desktop_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>i' -t string -s 'tile_up_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>j' -t string -s 'tile_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>,' -t string -s 'tile_down_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>l' -t string -s 'tile_right_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>u' -t string -s 'tile_up_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>m' -t string -s 'tile_down_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>o' -t string -s 'tile_up_right_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Alt>.' -t string -s 'tile_down_right_key'
              
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Left' -t string -s 'tile_left_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Super>Right' -t string -s 'tile_right_key'

xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Shift><Alt>Left' -t string -s 'move_window_left_workspace_key'
xfconf-query -c xfce4-keyboard-shortcuts -np '/xfwm4/custom/<Primary><Shift><Alt>Right' -t string -s 'move_window_right_workspace_key'
