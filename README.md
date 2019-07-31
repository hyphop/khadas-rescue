# Krescue - tiny fast rescure system for khadas VIMs boards

## status

experemintal!!!, tested on for VIM3 v1.2

## features

+ fully located in spi flash
+ all in ram
+ very fast
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

## what can i get from this 

+ we have always bootable system in anycase
+ we no need to use special software for updates upgrades rescue system etc.
+ we can install and setup any os to any strorages
+ muli bootable os
+ andvanced rescue system with resize move fsck and many other tools 
+ we have access to device via usb_net, wifi_ap, wifi_sta, eth_dhcp, usb_storage, ssh, http ...
+ no need any thing , we can use only usb-C cable or jsut wifi connection, no need uart, ethernet, flash, sd

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

