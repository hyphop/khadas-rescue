# KRESCUE online - mega

CHECK online list

    curl -sfL dl.khadas.com/.mega | sh -s - -l

GET ONLINE USAGE HELP

    curl -sfL dl.khadas.com/.mega | sh -s - --help

next commands lines demonstrage how-to

CHANGE system without SD card just by direct write to eMMC

    # goto COREELEC from openwrt | krescue
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3x.COREELEC.9.2.nightly.emmc.kresq > /dev/mmcblk2

    # goto OPENWRT from COREELEC
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIMx.OpenWrt.servers.test.emmc.kresq > /dev/mmcblk0

    # goto EmuElec from openwrt
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3x.EmuElec.ng.3.2.pre.emmc.kresq > /dev/mmcblk2

    # goto Volumio from EmuElec
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIMx.Volumio.test.emmc.kresq > /dev/mmcblk0

    # goto Ubuntu from Volumio
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIMx.Ubuntu-xfce-bionic_Linux-4.9_arm64_V20190917.emmc.kresq > /dev/mmcblk0

    # goto Android from Ubuntu
    mount -f -o remount,ro /
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3L.Android.Pie_V191130.emmc.kresq > /dev/mmcblk0

    # goto AndroidTV from Ubuntu
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3L.Android.TV_FINAL-v1.0-20191023.SC.emmc.kresq > /dev/mmcblk0

just write KRESCUE SYSTEM ONLY without images

    # write Krescue only
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L > /dev/mmcblk0

## write in two steps (safe method)

plz use this method! if

+ u have unstable or slow internet connection 
+ u just need an image file
+ u prefer to use another burning tool
+ u wish to save a current os build as a reusable image file

first step  ! download and Write to image file

    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L

second step ! if u have previous command without any errors u can write this image file direct to SD or EMMC card

    cat VIM3L.krescue.sd.mega.img > /dev/mmcblk2 && sync && reboot

# ADVANCED NOTES

## REMOUNT ROOTFS to RO

before write to emmc u need remount rootfs to RO - read only mode
this command make some warranty for correctly writing data
some system like ubuntu need this command before write image

    # goto single user rescue mode - its more safe for emmc write
    systemctl rescue

    # try remount to RO
    mount -f -o remount,ro /
    # check its RW or RO
    grep rootfs /proc/mounts | grep rw && echo "[w] still in RW" 
    # check RW processes 
    # MORE_INFO: https://wiki.debian.org/ReadonlyRoot
    # if not possible change to RO mode plz check next way

before system reboot u need make synchronization

    sync

after installation complite u can start reboot command or reset by button

    reboot

## WRITE with reboot system to krescue and write

if u have some problem to write mega image in one step plz use two steps

write krescue system only to eMMC and reboot to krescue

    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L > /dev/mmcblk0

Krescue system is save for direct write to emmc becouse stay in ram every time 
and not used any storage after start! now u can write installation images.

    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3L.Android.Pie_V191130.emmc.kresq > /dev/mmcblk0

## ANDOROID ISSUE

default android not have curl only wget (but wget dont acceps ssl) plz boot krescue from SD card

    console:/ $ su
    console:/ # ls /dev/block/mmcblk0

    console:/ # curl
    > curl: not found

    console:/ # wget http://dl.khadas.com/.mega
    > Connecting to dl.khadas.com (54.197.197.165:80)
    > wget: error getting response

