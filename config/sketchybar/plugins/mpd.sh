#!/bin/bash

# Hardcode the path so Sketchybar never gets confused
MPC_CMD="/usr/local/bin/mpc --host /tmp/mpd_socket"

# Get the current song title
# -f %title% ensures we get the metadata even if the player is technically 'paused'
SONG=$($MPC_CMD -f %title% current)

# If SONG is still empty here, the playlist is likely empty or MPD is stopped
if [ -z "$SONG" ]; then
  sketchybar --set "$NAME" label="No Song Playing"
  exit 0
fi

# Get the playback status (playing/paused)
STATUS=$($MPC_CMD status | grep -o "\[playing\]\|\[paused\]")

case "$STATUS" in
"[playing]")
  ICON="󰐊"
  ;;
"[paused]")
  ICON="󰏤"
  ;;
*)
  ICON="󰓛"
  ;;
esac

# Update Sketchybar with the icon and the song title
sketchybar --set "$NAME" label="$ICON $SONG"
