#!/bin/bash

MPC="/usr/local/bin/mpc"
SB="/usr/local/bin/sketchybar"

# Show song at startup
song=$($MPC current)
[[ -z "$song" ]] && song="⏸️ No Song Playing"
$SB --set mpd_song label="$song"

# Listen for MPD changes
while true; do
  $MPC idle player &>/dev/null
  song=$($MPC current)
  [[ -z "$song" ]] && song="⏸️ No Song Playing"
  $SB --set mpd_song label="$song"
done

