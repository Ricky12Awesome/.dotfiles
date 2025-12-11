#!/usr/bin/env bash

find ~/.steam/steam/steamapps/workshop/content/431960/ -maxdepth 2 -iregex ".*\.\(mp4\|webm\)" -printf "%p; %h-%f\n" | sed 's#;.*\/#;#' |
  while IFS=';' read -r source name; do
    if [[ -e "$PWD/$name" ]]; then
      rm "$PWD/$name"
    fi
    ln "$source" "$PWD/$name"
  done
