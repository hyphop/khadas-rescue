# any OS installation usage

1) INSTALL - DOWNLOAD & WRITE Krescue system to SD

we need write krescue system to sd card if we down have it already or 
write new krescue system to sd card if we need update old krescue system

## download link

+ https://dl.khadas.com/Firmware/Krescue/dump/

## linux sd image download & write EXAMPLE

```
cd /tmp
# download krescue system image
wget https://dl.khadas.com/Firmware/Krescue/dump/VIMx.krescue.sd.img.gz 
# download sd image write script
wget https://dl.khadas.com/Firmware/Krescue/dump/image2sd.sh
# write krescue image to sd card
sh ./image2sd.sh VIMx.krescue.sd.img.gz [/dev/sdX]
# or u can use simple dd for image write
# gzip -dc VIMx.krescue.sd.img.gz | dd bs=1M of=/dev/sdX
```

NOTE: replace VIMx to proper name ( VIM1 | VIM2 | VIM3 | VIM3L )

+ VIM1  - vim 1         soc S905X
+ VIM2  - vim 2         soc S912
+ VIM3  - vim 3         soc A311D
+ VIM3L - vim 3 light   soc S905D3

NOTE: plz write proper krescue image for every device!!!

2) 1st Krescue Boot up and PREPARE

start Krescue from SD card and make initialization (fist time - onetimes only - if we 
dont have usable partition on this sd )

krescue menu

    1) advanced => mount SD dump storage  - init dump storage
    2)          => USB refresh            - refresh export SD card via USB otg cable

3) 2nd DOWNLOAD installation os images

OK! now we can down any OS images to SD...
we can download images to same sd card
( by default its a second partion LABEL=dumps, exFAT formated )

+ https://dl.khadas.com/Firmware/Krescue/images/

## Download example (host side)

    # mkdir /mnt/dumps
    # sudo mount LABEL=dumps /mnt/dumps
    cd /mnt/dumps
    wget https://dl.khadas.com/Firmware/Krescue/images/VIMx.Volumio.emmc.kresq
    cd ..
    sudo umount /mnt/dumps

## installation os image name Examples

+ VIMx.Volumio.emmc.kresq - this image suitable for all VIMs devices VIM1 VIM2 VIM3 VIM3L
+ VIM1.LAKKA.2.3.pre.emmc.kresq - this image only for VIM1
+ VIM3L.COREELEC.9.2.0.emmc.kresq - this one only for VIM3L

4) 3nd INSTALLATION os images

boot up krescue -> krescue menu

    1) image WRITE to > EMMC
    2) + select any image
    3) PRESS OK
    4) PRESS INSTALL
    5) wait OK

5) REBOOT

+ remove SD card
+ reboot device

6) DONE

start installed OS from emmc

NOTE: just run `umenu` from ssh or serial console for krescue menu
