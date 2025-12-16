#!/bin/bash

# Get the current song from MPD
song=$(mpc current)

# If nothing is playing, show a placeholder
if [[ -z "$song" ]]; then
  song="⏸️ No Song Playing"
fi

# Update the SketchyBar item
sketchybar --set mpd_item label="$song"

