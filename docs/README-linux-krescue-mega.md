# KRESCUE online - mega

CHECK online list

    curl -sfL dl.khadas.com/.mega | sh -s - -l

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
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3L.Android.Pie_V191130.emmc.kresq > /dev/mmcblk0

    # goto AndroidTV from Ubuntu
    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L VIM3L.Android.TV_FINAL-v1.0-20191023.SC.emmc.kresq > /dev/mmcblk0

