# SPI flash read write linux kernel

## check spi flash mtd parts

`cat /proc/mtd`

## write U-Boot to SPI flash

`mtd write /tmp/sd/rescue/u-boot.spi.bin /dev/mtd0`

## check writed data

`mtd verify /tmp/sd/rescue/u-boot.spi.bin /dev/mtd0`

```
Verifying /dev/mtd0 against /tmp/rescue/rescue/u-boot.spi.bin ...
4082e4a6a3d4dfcb5894d9d34814d12f - /dev/mtd0
4082e4a6a3d4dfcb5894d9d34814d12f - /tmp/rescue/rescue/u-boot.spi.bin
Success
```

## clear SPI flash

`mtd clear /dev/mtd0`

## SPI flash remote dump

`ssh root@vim2 dd if=/dev/mtdblock0 bs=4096 > vim2.spi.bin`

