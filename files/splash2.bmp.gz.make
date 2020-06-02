#!/bin/sh

## hyphop ##

#= smart svg -> bmp rgb565 gz converter

#inkscape=$(which inkscape 2>/dev/null)

ffmpeg=$(which ffmpeg 2>/dev/null)

[ "$IMG" ] || IMG="$1"
[ "$IMG" ] || IMG="$(dirname $0)/splash2.svg"

OUT=${IMG%.*}.bmp

echo "[i] convert $IMG -> $OUT"

[ "$ffmpeg" ] || {
    echo "[i] ffmpeg not found plz install it">&2
    exit 1
}

$ffmpeg -y -hide_banner -i $IMG -vcodec bmp -f image2 - | gzip -c > $OUT

