## uboot srcipt

## hyphop ##

#= loop script test

ADDR=0x1000000

while true ; do

echo "[i] load test cmd"

mw.b $ADDR 0 65536
tftp $ADDR dhcp.cmd_test.scr
#tftp $ADDR dhcp.cmd_test.script

echo "loaded $filesize bytes to $ADDR"

md.b $ADDR 10

echo script $ADDR $filesize
script $ADDR $filesize

sleep 1

echo script $ADDR 20
script $ADDR 20

sleep 2

echo "END"

done

sleep 1000

