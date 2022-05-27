#!/bin/bash

class="$1"

wid=$(xdotool getwindowfocus)

if [[ $class == "$(xdotool getwindowfocus getwindowclassname)" ]]; then
  xdotool windowactivate $wid
  xdotool $4 --clearmodifiers $5 
else
  xdotool getwindowfocus $2 --window %1 $3
fi
