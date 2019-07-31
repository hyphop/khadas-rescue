#!/bin/sh

## hyphop ##

B="$(dirname $0)"

PACK="mkimage -C none -A arm -T script -d"

CMD(){
    echo "$@"
    $@
}

IN=${0%.*}.cmd_
OUT=${0%.*}.scr

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



