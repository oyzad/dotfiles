#!/bin/bash

apps_transparent="(iTerm2|Spotify|kitty)"

display_resolution=$(system_profiler SPDisplaysDataType | grep Resolution)
if [[ $(echo "$display_resolution" | grep -c "Resolution") -ge 2 ]]; then
  apps_stream="(Brave|Google Chrome|Discord|)"
  # This keeps apps always below, seems to be working fine when I switch to other
  # apps
  apps_mgoff_below="(Calculator|Cog|VLC|GIMP|Notes|Activity Monitor|App StoreSoftware Update|Brave|Google Chrome|Stickies|kitty|Photo Booth|Spotify)"
else
  apps_stream="()"
  # This keeps apps always below, seems to be working fine when I switch to other
  # apps
  apps_mgoff_below="(Calculator|Cog|VLC|GIMP|Notes|Activity Monitor|App StoreSoftware Update|Brave|Google Chrome|Stickies|kitty|Photo Booth|Discord|Spotify)"
fi

apps_mgoff_above="()"
