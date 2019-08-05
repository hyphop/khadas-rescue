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

## setup bootmode u-boot from SPI

kbi bootmode r

echo "[i] use next command line for activate boot from spi flash"

echo "kbi bootmode w spi; kbi poweroff; echo press POWER_ON key"

# kbi bootmode w spi; kbi poweroff; echo press POWER_ON key"

WAIT=1000

echo "[i] wait $WAIT sec! plz use Ctrl+C for break it"

sleep $WAIT


##END##
