#!/usr/bin/env sh

screenshots=Pictures/screenshots

geo=$(slurp -d)

if ! [[ -z $geo ]]; then
  mkdir -p $HOME/$screenshots 2> /dev/null

  filename="$(date +"%Y-%m-%d %H-%M-%S %N").png"
  filepath="$HOME/$screenshots/$filename"

  grim -g "$geo" -t png - > $filepath
  wl-copy < $filepath
  notify-send --icon "$filepath" -t 4000 "Screenshot taken" "~/$screenshots/$filename" 
else  
  notify-send "Screenshot aborted" -t 4000
fi


