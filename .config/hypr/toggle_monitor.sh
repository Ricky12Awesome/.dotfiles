#!/usr/bin/env bash

file="$HOME/.cache/toggle_monitor"

if ! [[ -e $file ]]; then
  echo "true" > $file
fi

function toggle_monitor() {
  if [[ $toggle = "false" ]]; then
    line1="keyword monitor HDMI-A-1, disabled"
    line2="keyword monitor DP-1, 2560x1440@170, 0x0, 1, vrr, 2"

    hyprctl --batch "$line1;$line2" > /dev/null
  else
    line1="keyword monitor HDMI-A-1, 3840x2160, 0x0, 1"
    line2="keyword monitor DP-1, 2560x1440@170, 3840x0, 1, vrr, 2"
  
    hyprctl --batch "$line1;$line2" > /dev/null
  fi
}

if [[ "-s" =~ ^($@)$ ]]; then
  toggle="$(cat $file)"
  toggle_monitor
  exit
fi

if [[ $(cat $file) = "true" ]]; then
  toggle="false"
  echo "false" > $file
else
  toggle="true"
  echo "true" > $file
fi

toggle_monitor

