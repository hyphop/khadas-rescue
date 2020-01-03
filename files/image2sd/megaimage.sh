#!/bin/sh

## hyphop ##

#= simple krescue mega image write example

USAGE(){ echo "
USAGE

output to KRESCUE.sd.mega.img

    ./megaimage.sh KRESCUE.sd.img.gz IMAGE.kresq [ IMAGE.kresq ] ...

output to stdout

    ./megaimage.sh VIM3L.krescue.sd.img.gz *.kresq > VIM3L.krescue.sd.mega.img

write to sd card

    ./megaimage.sh VIM3L.krescue.sd.img.gz *.kresq | dd bs=1M of=/dev/sdX

" >&2

exit 1
}

Q="$1"
[ "$1" ] || USAGE
shift
[ "$1" ] || USAGE

gzip -l "$Q" 2>/dev/null 1>&2 || USAGE
for i in $@; do
    tail -c16 $i | grep -q "##KRESCUE##END" || USAGE
done

T="$(readlink /proc/$$/fd/1)"
O="$(basename $Q)"
O="${O%.img.gz}.mega.img"

MEGA(){
echo "[i] OUT to $O">&2
gzip -dc "$Q"
cat "$@"
}

case $T in
    /dev/pts*)
    ;;
    *pipe:*)
    O="PIPE"
    MEGA "$@"
    exit 0
    ;;
    *)
    O="$T"
esac

MEGA "$@" > $O
