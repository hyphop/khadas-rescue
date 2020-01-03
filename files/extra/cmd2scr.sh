#!/bin/sh

## hyphop ##

#= uboot script mkimage packer

USAGE(){ echo " USAGE: cmd2scr input [output]
">&2
}

[ "$1" ] || {
    echo "[e] file not defined">&2
    USAGE
    exit 1
}

[ -f "$1" ] || {
    echo "[e] file not found $1">&2
    USAGE
    exit 1
}

IN=$1
OUT=$2

[ "$OUT" ] || OUT=${1%.*}.scr

CMD(){
    echo "# $@"
    $@
}

CMD mkimage -C none -A arm -T script -d $IN $OUT

