#!/bin/bash

layout=$(yabai -m query --spaces --space | jq -r '.type')

icon=""

case $layout in
bsp)
  icon="" # You can pick a cool icon for bsp
  ;;
stack)
  icon="" # Icon for stack
  ;;
float)
  icon="" # Icon for float
  ;;
esac

sketchybar --set yabai_layout icon="$icon"
