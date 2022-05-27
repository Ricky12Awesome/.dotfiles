#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar bspwm-main >&1 | tee -a /tmp/polybar_main.log & disown
polybar bspwm-external >&1 | tee -a /tmp/polybar_exteranl.log & disown
