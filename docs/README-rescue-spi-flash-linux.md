# SPI flash read write linux kernel

## check spi flash mtd parts

`cat /proc/mtd`

## write U-Boot to SPI flash

`mtd write /tmp/u-boot.spi.bin /dev/mtd0`

## clear SPI flash

`mtd clear /dev/mtd0`

## SPI flash remote dump

`ssh root@vim2 dd if=/dev/mtdblock0 bs=4096 > vim2.spi.bin`

