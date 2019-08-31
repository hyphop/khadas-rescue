# Krescue - rescue system

rescue system https://github.com/hyphop/khadas-rescue for khadas VIMs boards

## Docs paths

find *.txt or *.md / README*.txt or README*.md files by paths

+ /rescue/docs		- on sd card
+ /tmp/sd/rescue/docs	
+ /tmp/sd/rescue/
+ /usr/share/rescue/docs
+ https://github.com/hyphop/khadas-rescue/docs

## utils & tools collection

use `help` in command line for get more info

## some rescue commands sorted by groups

    # disk
    blkid fdisk cfdisk dd
    ? exfatfsck exfatlabel mkexfatfs ?
    mkfs.ext2  mkfs.ext3  mkfs.ext4  mkfs.fat
    resize2fs tune2fs

    # network
    curl (https) rsync tcpdump nc resolveip bwm-ng
    wpa_cli wpa_supplicant hostapd hostapd_cli openvpn

    # arc
    gzip, lzma, xz, bunzip2

    # text
    help nano diff patch cmp ...

    # tools
    kexec mkimage dtc fdt* lsusb ...

    ... and many other + u can use `opkg install` if u need more ..

## extra

    # utils
    eth_status eth_on eth_off
    watch temp cpu_freq_fix cpu_freq color_test fbtest

    # usb otg 
    usb_otg_ether usb_otg_ether_gw usb_otg_stop usb_otg_storage

    # net
    nat wifi* dhcp_server* 
    ipv6 ifrestart

    # khadas
    bootmode fan led

    # sd / mmc / spi
    # mmc mmc_boot 
    # spi spi_boot spi_flash spi_write

    # kernel modules
    modules_list
