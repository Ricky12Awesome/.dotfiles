#!/usr/bin/env bash

dirs=$(/usr/bin/ls -AI ".git")
files=$(/usr/bin/find $dirs -type f)

for dest in $files; do
  source=$HOME/$dest

  if ! [[ -e $source ]]; then
    continue
  fi

  if cmp -s $source $dest; then
    continue 
  fi

  if [[ "-f" =~ ^($@)$ ]]; then
    /usr/bin/cp -f $source $dest 
  else 
    /usr/bin/cp -i $source $dest
  fi

done
