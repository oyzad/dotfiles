#!/usr/bin/env bash
case $(file --mime-type "$1" -b) in
image/*) 
    magick convert -resize x256 "$1" "/tmp/.tmp.sixel"
    cat "/tmp/.tmp.sixel"
;;
*) file "$1" ;;
esac
case "$1" in
    *.epub)
        bk --meta "$1"
        ;;
    *)
        # fallback to something else, or do nothing
        ;;
esac
