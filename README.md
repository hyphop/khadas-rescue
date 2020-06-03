# Krescue - tiny fast rescure system for khadas VIMs and Edge boards (amlogic & rockchips socs)

One universal rescue system for khadas vims boards.
We try to make one simple alternative way for solve common users problems!

+ https://github.com/hyphop/khadas-rescue
+ https://forum.khadas.com/t/krescue-take-full-control-of-your-vim-device/5945

## status

tested on VIM1 VIM2 VIM3 VIM3L Edge

## features

+ can fully located in SPI flash, same as in eMMC or SD card
+ mainline linux kernel
+ all in ram
+ very fast just a 10 sec full boot time
+ flash disks frendly
+ extreme small about ~ 16M
+ openwrt based / open source
+ net eth (dhcp client) + wifi (ap + sta)
+ usb gadget modes: usb_net + usb_storage
+ kexec for advanced post boot other os
+ advanced uboot
+ rescue mode for repare install reinstall etc...
+ fully customizations and automations
+ advanced smart boot sequences
+ hot keys
+ read more [docs/README-rescue.md](docs/README-rescue.md)

## what can i get from this 

+ we have always bootable system in anycase
+ its unkillable rescue system 
+ we no need to use special software for updates upgrades rescue system etc.
+ we can install and setup any os to any storages
+ muli bootable os
+ andvanced rescue system with resize move fsck and many other tools 
+ we have access to device via usb_net, wifi_ap, wifi_sta, eth_dhcp, usb_storage, ssh, http ...
+ no need any thing , we can use only usb-C cable or jsut wifi connection, no need uart, ethernet, flash, sd

## releases - downloads images

+ https://dl.khadas.com/Firmware/Krescue/
+ https://github.com/hyphop/khadas-rescue/releases
+ https://github.com/hyphop/khadas-rescue/releases/tag/vim2
+ https://github.com/hyphop/khadas-rescue/releases/download/vim2/krescue.sd.img.gz - VIM2 sd card image

## write VIM2 SD image - example

    # u can run this one-command line anywhere on vims device or your working machine 
    # just write correct SD card location )))
    curl -jkL https://github.com/hyphop/khadas-rescue/releases/download/vim2/krescue.sd.img.gz -o- | gzip -dc | dd conv=sync of=/dev/YOUR_SD_CARD
    # same with sudo
    curl -jkL https://github.com/hyphop/khadas-rescue/releases/download/vim2/krescue.sd.img.gz -o- | gzip -dc | sudo dd conv=sync of=/dev/YOUR_SD_CARD

## dirs and files

+ [share](share) - its work place 
+ [docs](docs) - docs
+ [script](scripts) - scripts
+ [files](files) - files

## usage

    ../scripts/prepare
    # or
    ../scripts/prepare_dev
    # make image
    ../scripts/pack_image
    # other
    ....

## to do

+ docs / mans !!!
+ its just begin, and we need to do to much )))

## related projects

+ https://github.com/hyphop/khadas-linux-kernel
+ https://github.com/hyphop/khadas-uboot-spi
+ https://github.com/hyphop/khadas-openwrt
+ https://github.com/hyphop/uboot-extra

## links

+ https://docs.khadas.com
+ https://github.com/khadas
+ https://forum.khadas.com/t/krescue-take-full-control-of-your-vim-device/5945
