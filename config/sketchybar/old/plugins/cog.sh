#!/bin/bash

NOW_PLAYING_FILE="$HOME/Library/Application Support/Cog/NowPlaying.txt"
MAX_LENGTH=30  # Max length before we scroll
SCROLL_SPEED=1 # Characters to scroll per update
SCROLL_FILE="/tmp/cog_scroll.txt"

if [[ ! -f "$NOW_PLAYING_FILE" ]]; then
  sketchybar --set $NAME label="Cog Not Running"
  exit 0
fi

SONG_INFO=$(cat "$NOW_PLAYING_FILE")

if [[ -z "$SONG_INFO" ]]; then
  sketchybar --set $NAME label="No Music Playing"
  exit 0
fi

# Scrolling logic
if [[ ${#SONG_INFO} -le $MAX_LENGTH ]]; then
  # Short song, no scrolling needed
  sketchybar --set $NAME label="🎵 $SONG_INFO"
  echo 0 >"$SCROLL_FILE" # reset scroll position
else
  # Long song, scroll it
  if [[ -f "$SCROLL_FILE" ]]; then
    SCROLL_POS=$(cat "$SCROLL_FILE")
  else
    SCROLL_POS=0
  fi

  # Calculate substring to display
  SCROLL_TEXT="${SONG_INFO}    ${SONG_INFO}" # add padding for loop feel
  DISPLAY_TEXT="${SCROLL_TEXT:$SCROLL_POS:$MAX_LENGTH}"

  sketchybar --set $NAME label="🎵 $DISPLAY_TEXT"

  # Update scroll position
  SCROLL_POS=$(((SCROLL_POS + SCROLL_SPEED) % ${#SONG_INFO}))
  echo $SCROLL_POS >"$SCROLL_FILE"
fi
