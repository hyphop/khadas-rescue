# Krescue usage

## DOWNLOAD LINK

+ https://dl.khadas.com/Firmware/Krescue/dump/

## 1st - INSTALL and WRITE Krescue system to SD

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

+ VIM1  - vim 1		soc S905X
+ VIM2  - vim 2		soc S912
+ VIM3  - vim 3		soc A311D
+ VIM3L - vim 3 light	soc S905D3

NOTE: write proper krescue image for every device!!!

## 1st Krescue Boot up

in start up menu

    advanced => mount SD dump storage	- init dump storage
	     => USB refresh		- refresh export SD card via USB otg cable

u can download os images on host machine to exported SD card dump storage

```
lsscsi | grep Krescue
[4:0:0:0]    disk    Krescue. MMC                    /dev/sdd 
[4:0:0:1]    disk    Krescue. SD                     /dev/sde 
[4:0:0:2]    disk    Krescue. RAM                    /dev/sdf 
```

NOTE:	/dev/sde2 	its a dump storage
NOTE: 	u can download direct to sd just remove from board device and insert into host machine 
NOTE:	krescue always run from ram u can remove sd card at any time 

## 2nd Download OS images to SD

+ https://dl.khadas.com/Firmware/Krescue/images/

### Download example (host side)

    mkdir /tmp/dumps
    sudo mount /dev/sde2 /tmp/dumps
    # or same by label
    # sudo mount LABEL=dumps /tmp/dumps
    cd /tmp/dumps
    wget https://dl.khadas.com/Firmware/Krescue/images/VIMx.Volumio.emmc.kresq
    cd ..
    sudo umount /tmp/dumps


## 3nd return to running Krescue INSTALL OS

back to start up menu

    image WRITE to > EMMC
    + select any image
    PRESS OK
    PRESS INSTALL
    wait OK

## END

+ remove SD card
+ reboot device 

## DONE

start installed OS from emmc

## NOTE

    VIMx.Volumio.emmc.kresq - this image suitable for all VIMs devices VIM1 VIM2 VIM3 VIM3L
