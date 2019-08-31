# boot source detection example

BOOT_FROM=

#define BOOT_DEVICE_RESERVED    0
#define BOOT_DEVICE_EMMC        1
#define BOOT_DEVICE_NAND        2
#define BOOT_DEVICE_SPI         3
#define BOOT_DEVICE_SD          4
#define BOOT_DEVICE_USB         5

md.b ff800240 1

itest.b *ff800240 == 0xf1 && BOOT_FROM=emmc
itest.b *ff800240 == 0xf3 && BOOT_FROM=spi
itest.b *ff800240 == 0xf4 && BOOT_FROM=sd
itest.b *ff800240 == 0xf5 && BOOT_FROM=usb
itest.b *ff800240 == 0xb1 && BOOT_FROM=emmc
itest.b *ff800240 == 0xb3 && BOOT_FROM=spi
itest.b *ff800240 == 0xb4 && BOOT_FROM=sd
itest.b *ff800240 == 0xb5 && BOOT_FROM=usb

echo "**KRESCUE LOAD FROM $BOOT_FROM**"
