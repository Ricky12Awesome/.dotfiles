#!/usr/bin/env bash

if [[ $DESKTOP_SESSION = "plasmax11" ]]; then
  # nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_170 +2560+0 {AllowGSYNCCompatible=On}, HDMI-0: 3840x2160_60 +0+0 {viewportin=2560x1440}"
  xrandr --output HDMI-0 --scale-from 2560x1440 --output DP-0 --mode 2560x1440 -r 170 --pos 2560x0
fi
