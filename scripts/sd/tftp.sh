#!/bin/sh

## hyphop ##

#= copy sd card to ram => /tmp/rescue

#/ USAGE
#  edit 80_user_env.txt file next line
#  rescue_custom="... script=sd:test.sh"

D=/tmp/tftp

[ -d "$D" ] || mkdir -p $D

FTPHOST=$(cat /tmp/net/wan/router)
MSG="[i] $0 download from $FTPHOST"

logger -s -t RESCUE "$MSG"

(
FILES="u-boot.legacy.sd.bin u-boot.mainline.sd.bin \
u-boot.legacy.spi.bin u-boot.mainline.spi.bin"

for F in $FILES; do
    logger -s -t RESCUE "atftp -g -r $F -l $D/$F $FTPHOST"
    atftp -g -r $F -l $D/$F $FTPHOST
done

) >/tmp/tftp.log 2>&1 &
