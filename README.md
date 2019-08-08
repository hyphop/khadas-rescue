# Krescue - tiny fast rescure system for khadas VIMs boards

## status

Experimental!!!, tested on VIM3 boards only!

https://github.com/hyphop/khadas-rescue

## features

+ fully located in spi flash
+ all in ram
+ very fast just a 10 sec full boot time
+ flash disks frendly
+ extreme small
+ openwrt based
+ open source
+ net eth (dhcp client) + wifi (ap + sta)
+ usb gadged modes: usb_net + usb_storage
+ kexec for advanced post boot other os
+ advanced uboot
+ rescue mode for repare install reinstall etc...
+ fully customizations
+ fully automations
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

## downloads system images

+ https://github.com/hyphop/khadas-rescue/releases


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
    ../scripts/pack_spi_image

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
