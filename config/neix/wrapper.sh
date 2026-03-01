#!/bin/sh
echo "$NEIX_URL" >>~/.local/share/neix/seen_urls
mpv --force-window=immediate "$NEIX_URL"
