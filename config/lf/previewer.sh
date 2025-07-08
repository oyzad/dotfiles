#!/usr/bin/env bash
case $(file --mime-type "$1" -b) in
image/*) 
    magick convert -resize x256 "$1" "/tmp/.tmp.sixel"
    cat "/tmp/.tmp.sixel"
;;
*) file "$1" ;;
esac
