#!/bin/sh

## hyphop ##

#= copy sd card to ram => /tmp/rescue

#/ USAGE
#  edit 80_user_env.txt file next line
#  rescue_custom="... script=sd:test.sh"

D=/tmp/sd
#SD=/dev/mmcblk?p1
SD="$(mmcdisk sd)p1"

MSG="[i] $0 copy $SD -> $D"

logger -t RESCUE "$MSG"

mkdir $D $D.mnt 1>/dev/null 2>/dev/null

for sd in $SD; do
    [ -b "$sd" ] && {
    mount -o ro $SD $D.mnt
    cd $D.mnt
    ls -l1
    cp -a * $D
    cd ..
    umount $D.mnt && rm $D.mnt
    break
    }
done

logger -t RESCUE "$MSG - done"
