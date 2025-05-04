#!/bin/bash

PLAYER_STATE=$(osascript -e 'tell application "Spotify" to player state')

if [ "$PLAYER_STATE" = "playing" ]; then
  TRACK="$(osascript -e 'tell application "Spotify" to name of current track')"
  ARTIST="$(osascript -e 'tell application "Spotify" to artist of current track')"

  # Update the song label
  sketchybar --set spotify_label label="$TRACK - $ARTIST"

  # Show the previous and next buttons
  sketchybar --set spotify_prev drawing=on
  sketchybar --set spotify_next drawing=on

elif [ "$PLAYER_STATE" = "paused" ]; then
  TRACK="$(osascript -e 'tell application "Spotify" to name of current track')"
  ARTIST="$(osascript -e 'tell application "Spotify" to artist of current track')"

  # Update the song label
  sketchybar --set spotify_label label=""

  # Hide the previous and next buttons
  sketchybar --set spotify_prev drawing=on
  sketchybar --set spotify_next drawing=on

else
  # No music playing
  sketchybar --set spotify_label label="No Music Playing"

  # Hide the buttons
  sketchybar --set spotify_prev drawing=off
  sketchybar --set spotify_next drawing=off
fi
