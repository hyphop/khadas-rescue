#!/bin/sh

## hyphop ##

#= mkimage wrapper for uboot auto script 

B="$(dirname $0)"

PACK="mkimage -C none -A arm -n AUTOSCRIPT -T script -d"

CMD(){
    echo "$@"
    $@
}

[ "$IN" ] || IN="$1"
[ "$IN" ] || IN=${0%.*}.cmd_
[ "$OUT" ] || OUT="$2"
[ "$OUT" ] || OUT=${IN%.*}.scr

echo "[i] $IN > $OUT">&2

[ -f "$IN" ] || {
    echo "[i] undef input">&2
    exit 1
}

#CMD $B/../scripts/cmd2scr ${0%.*}.cmd_ ${0%.*}.scr
CMD $PACK $IN $OUT

cd $B

ln -sf $OUT boot.scr
ln -sf $OUT C0A86479.img
