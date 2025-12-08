#!/bin/bash

monitors=$(hyprctl monitors all -j | jq ".[].id")
timeout="/tmp/hyprland_cursor_inactive_timeout"

open() {
    hyprctl getoption "cursor:inactive_timeout" -j | jq ".float" > $timeout
    hyprctl keyword "cursor:inactive_timeout 1" -q
    
    for i in $monitors; do
        eww open blackscreen --screen "$i" --id "m$i" --arg id="m$i"
    done
}

close() {
    hyprctl keyword "cursor:inactive_timeout $(cat $timeout)" -q
    
    for i in $monitors; do
        eww close "m$i"
    done
}

case $1 in
    open) open ;;
    close) close ;;
    *) notify-send "Inccorect argument, valid: [open, close]"
esac