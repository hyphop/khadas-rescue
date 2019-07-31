## uboot srcipt

## hyphop ##

ADDR=1000000

echo "[i] load test cmd"
mw.b $ADDR 0 65536
tftp $ADDR dhcp.cmd_test.script

echo "loaded $filesize bytes to $ADDR"

echo script $ADDR
script $ADDR

echo "END"

sleep 1000
