# READ WRITE disk data by http

## READ data disk by http

read from mmc / sd / spi / sdc ..... device disk

    NOTE: mdns krescue.local hostname can resolved to USB_IP same as ETH_IP
    NOTE: USB_NET is about 15MB/s transfer speed
    NOTE: ETH_NET 100Mbit mode is  about 10MB/s transfer speed
    NOTE: ETH gigabit lan (VIM2 VIM3 VIM3L) is about 110MB/s transfer speed

### examples

device alias mode examples

   wget http://krescue.local/cgi-bin/disk/rd/mmc
   wget http://172.22.1.1/cgi-bin/disk/rd/sd
   curl http://krescue.local/cgi-bin/disk/rd/mmc > vim3_raw_mmc_image.bin
   wget http://192.168.1.150/cgi-bin/disk/rd/mmc -O vim3_raw_mmc_image.bin


## next example download only 5G emmc of image

   wget http://krescue.lan/cgi-bin/disk/rdz/mmc:5G

   > VIM2.1586162412.5G.emmc.img.zst

device block name mode examples

   wget http://172.22.1.1/cgi-bin/disk/rd/dev/sda
   wget http://172.22.1.1/cgi-bin/disk/rd/dev/mmcblk1

### more access info

    http://172.22.1.1/cgi-bin/disk/rd
    http://ETH_IP/cgi-bin/disk/rd
    http://krescue.local/cgi-bin/disk/rd

    mmc1		-> mmc part 1
    sd			-> sd
    sd1			-> sd part 1
    sd2			-> sd part 2
    dev/mmcblk1p1	-> /dev/mmcblk1p1
    dev/mmcblk1p1	-> /dev/mmcblk1p1
    dev/sda		-> /dev/sda
    dev/sdb		-> /dev/sdb

## WRITE data to disk by http

write to mmc / sd / spi / sdc ..... device disk

    http://172.22.1.1/cgi-bin/disk/wr
    http://ETH_IP/cgi-bin/disk/wr
    http://krescue.local/cgi-bin/disk/wr

## usage

   # raw image
   curl --data-binary @IMG HOST/cgi-bin/disk/wr/mmc

   # compressed stream
   curl --data-binary @IMG.gz  HOST/cgi-bin/disk/wr/mmc.gz
   curl --data-binary @IMG.xz  HOST/cgi-bin/disk/wr/mmc.xz
   curl --data-binary @IMG.zst HOST/cgi-bin/disk/wr/mmc.zst

## examples

fastest way write image direct to emmc by net (USB|ETH)

   curl --data-binary @VIM*.img.zst krescue.local/cgi-bin/disk/wr/mmc.zst
   curl --data-binary @$(ls VIM*.img.zst) krescue.local/cgi-bin/disk/wr/mmc.zst

HTTP RESPONSE

```
POST
/dev/mmcblk2
zstd
application/x-www-form-urlencoded
585052120
0
```

## write2emmc - upload script

```
#!/bin/sh

ext=
file "$1" | grep -q "Zstandard" && ext=.zst
curl --data-binary @"$1" krescue/cgi-bin/disk/wr/mmc$ext

```

## kwrite_http example


```

cd ../khadas/fenix/build/images

ls -l1 VIM1_Debian-server-buster_Linux-5.5-rc2_arm64_SD-USB_V0.8.3-20200413.img

-rw-r--r-- 1 root root 2738880512 Apr 13 17:14 VIM1_Debian-server-buster_Linux-5.5-rc2_arm64_SD-USB_V0.8.3-20200413.img

curl krescue.local/tools/kwrite | sh -s - VIM3*.img

# or

wget krescue.local/tools/kwrite

sh ./kwrite VIM3L_Debian-server-buster_Linux-5.5-rc2_arm64_SD-USB_V0.8.3-20200413.img 

[i] compress VIM3L_Debian-server-buster_Linux-5.5-rc2_arm64_SD-USB_V0.8.3-20200413.img and write => krescue
[i] wait ...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  566M    0   265  100  566M      3  7187k  0:01:20  0:01:20 --:--:--    68

# IMAGE WAS WRITED

to       : /dev/mmcblk2
bytes    : 593575110
format   : zstd
duration : 81
status   : 0

# PARTS

/dev/mmcblk2p2: LABEL="ROOTFS" UUID="c6e5e4f8-0cb5-4e50-b3a6-1478dfb49edc" TYPE="ext4"
/dev/mmcblk2p1: LABEL="BOOT" UUID="5DF2-E5A1" TYPE="vfat"

```
