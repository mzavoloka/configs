#!/usr/bin/sh
currenthour=$(date +%H);
if [ $currenthour -ge 20 ] || [ $currenthour -le 7 ]; then
    xfce4-terminal;
else
    xfce4-terminal --color-text=black --color-bg=white;
fi
