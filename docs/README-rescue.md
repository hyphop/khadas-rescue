# Rescue sd/mmc/usb image help

rescue system utils & tools collection

use `help` in command line for get more info

## some rescue commands sorted by groups

    # disk
    blkid fdisk cfdisk dd
    mkfs.ext4 mkfs.fat exfatfsck exfatlabel 

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
    fan eth_status watch temp cpu_freq_fix cpu_freq color_test fbtest

    # usb otg 
    usb_otg_ether usb_otg_ether_gw usb_otg_stop usb_otg_storage

    # net
    nat wifi* dhcp_server* 

