#!/bin/bash

# Get the pane's starting path in tmux, if available
#cd "$(tmux display -p '#{pane_start_path}')" || exit

# Get the Git remote URL
url=$(git remote get-url origin 2>/dev/null)

# Exit if no remote URL found
if [[ -z "$url" ]]; then
  echo "No remote origin found."
  exit 1
fi

# Convert SSH GitHub URL to HTTPS format
if [[ "$url" == *github.com* ]]; then
  if [[ "$url" == git@* ]]; then
    url="${url#git@}"       # remove "git@"
    url="${url/:/\/}"       # replace ":" with "/"
    url="https://${url}"    # prepend https://
  fi
fi

# Open the URL (macOS: 'open', Linux: 'xdg-open')
if command -v open >/dev/null 2>&1; then
  open "$url"
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$url"
else
  echo "Could not detect a command to open URLs."
  echo "Repository URL: $url"
fi

