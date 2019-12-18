# Krescue - rescue system for khadas VIM1 VIM2 VIM3 VIM3L boards

krescue special system for khadas VIM1 VIM2 VIM3 VIM3L boards

+ all in ram system - posible to clean destroy format remove all device storage without system crash
+ full access to internal storages
+ usb export emmc sd ram
+ usb network otg mode (auto config)
+ eth network (dhcp)
+ uart - serial console 
+ root - no password
+ full device control
+ kbi (change boot mode / port mode)
+ boot from sd / emmc / spi / dhcp tftp pxe / ...
+ many other ....

## DOWNLOAD IMAGES

+ https://dl.khadas.com/Firmware/Krescue/

## INSTALL WRITE image to SD card

### Linux - default installation method examples

    wget https://dl.khadas.com/Firmware/Krescue/*.sd.img.gz
    gzip -dc KRESCUE_IMAGE.sd.img.gz | sudo dd bs=1M of=/dev/YOUR_SD_CARD

    wget https://dl.khadas.com/Firmware/Krescue/*.sd.zip
    unzip -p KRESCUE_IMAGE.sd.zip '*.img' | sudo dd bs=1M of=/dev/YOUR_SD_CARD

NOTE: Remember to replace the words KRESCUE_IMAGE and YOUR_SD_CARD, to the correct values in your system.

### image2sd.sh - console linux USAGE

simple console image writer to SD card (direct write from zip gz xz 7z packed images and raw images)

    wget https://dl.khadas.com/Firmware/Krescue/dump/image2sd.sh
    wget https://dl.khadas.com/Firmware/Krescue/*.sd.zip

    ./image2sd.sh KRESCUE_IMAGE.sd.zip /dev/sdX

### Another OS (or if previous methods were difficult for you) or Linux GUI

Use [Balena Etcher](https://www.balena.io/etcher/) to burn the Krescue image to your SD card or USB flash media.

    sudo ./balenaEtcher-1.5.57-x64.AppImage

Just select the KRESCUE_IMAGE.img.gz or KRESCUE_IMAGE.img.zip image, and select your SD card as the target. Press burn!
( There is no need to decompress the image )

## BOOT tips

start from sd | or forse setup emmc to mask rom mode

## LINKS

+ https://dl.khadas.com/Firmware/Krescue/
+ https://www.khadas.com/vim1
+ https://www.khadas.com/vim2
+ https://www.khadas.com/vim3
+ https://www.khadas.com/vim3l
+ https://www.lakka.tv/get/linux/s905/install/
+ https://www.lakka.tv/doc/alternative-image-flashing-methods/
