#!/bin/bash

wallpaper_dir="$HOME/Wallpapers"
current="$(cat /tmp/current-wallpaper 2>/dev/null || echo '')"
next="$(ls "$wallpaper_dir" | sort | awk -v c="$current" 'c==""{print $1; exit} $0>c{print $0; exit}')"
[ -z "$next" ] && next="$(ls "$wallpaper_dir" | sort | head -n 1)"

feh --bg-scale "$wallpaper_dir/$next"
echo "$next" > /tmp/current-wallpaper
