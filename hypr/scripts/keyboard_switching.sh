#!/usr/bin/env bash

# Run hyprctl and capture its JSON output
json=$(hyprctl devices -j)

# Use jq to find the active_layout_index of the main keyboard
# -r prints raw output (no quotes)
active_index=$(echo "$json" |
    jq -r '
        .keyboards[]                     # iterate over each keyboard object
        | select(.main == true)   # keep only the one we want
        .active_layout_index            # output the field we care about
    ')

if [[ "$active_index" -eq 0 ]]; then
    hyprctl switchxkblayout current 1
    notify-send "Switched layout to qwerty"
elif [[ "$active_index" -eq 1 ]]; then
    hyprctl switchxkblayout current 0
    notify-send "Switched laybout to bepo"
else
    notify-send "Couldn't switch keyboard layout"
fi
