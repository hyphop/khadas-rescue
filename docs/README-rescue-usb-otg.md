# Krescue - usb otg mode

+ usb disk export internal storages from device to host
+ usb network device <=> host (dhcp autoconfig)

ABOUT: simple way get easy acces to VIMs internal device storages
NOTE:  this method is univerlas for any host os ( windows|mac|linux|... )
INFO:  https://github.com/hyphop/khadas-rescue/docs

## Host machine

    master@peace:~$ lsscsi | grep Krescue # linux show exported storages
    [4:0:0:0]    disk    Krescue. MMC                    /dev/sdX 
    [4:0:0:1]    disk    Krescue. SD                     /dev/sdY 
    [4:0:0:2]    disk    Krescue. RAM                    /dev/sdZ 

NOTE: MMC - is internal emmc storage | SD - sd card | RAM - info ram device

## Dump internal device storage image example on host machine (LINUX EXAMPLE)

    sudo dd if=/dev/sdX bs=1M of=dump.img             # raw
    sudo dd if=/dev/sdX bs=1M | gzip -c > dump.img.gz # gziped

## Write image from host machine to internal device storage (LINUX EXAMPLE)

    sudo dd if=dump.img bs=1M of=/dev/sdX             # raw
    gzip -dc dump.img.gz | sudo dd bs=1M of=/dev/sdX  # gziped

