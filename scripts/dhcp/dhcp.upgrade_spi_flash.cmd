## uboot srcipt

## hyphop ##

#= uboot script for spi flash update

echo "[i] DHCP boot script $now"
echo "[i] full spi flash write"

ADDR=1000000
SPI_HZ=104000000

echo "[i] sf probe $SPI_HZ"

sf probe 0 $SPI_HZ

echo "[i] load spi image"
tftp $ADDR image.spi.bin
echo "loaded $filesize bytes to $ADDR"
echo "write it"
echo "sf update $ADDR 0 $filesize"
sf update $ADDR 0 $filesize

echo "END"

sleep 1000


##END##
