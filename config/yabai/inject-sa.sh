#!/bin/bash

# wait until yabai is running
while ! pgrep -x "yabai" >/dev/null; do
  sleep 0.5
done

# attempt to load the scripting addition
/usr/bin/osascript -e 'tell application "System Events" to do shell script "/usr/local/bin/yabai --load-sa" with administrator privileges'

