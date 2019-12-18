# read disk data by http

read from mmc / sd / spi / sdc ..... device disk

    NOTE: mdns krescue.local hostname can resolved to USB_IP same as ETH_IP
    NOTE: USB_NET is about 15MB/s transfer speed
    NOTE: ETH_NET 100Mbit mode is  about 10MB/s transfer speed
    NOTE: ETH gigabit lan (VIM2 VIM3 VIM3L) is about 110MB/s transfer speed

## examples

device alias mode examples

   wget http://krescue.local/cgi-bin/disk/rd/mmc
   wget http://172.22.1.1/cgi-bin/disk/rd/sd

   curl http://krescue.local/cgi-bin/disk/rd/mmc > vim3_raw_mmc_image.img
   wget http://192.168.1.150/cgi-bin/disk/rd/mmc -O vim3_raw_mmc_image.img

   curl http://krescue.local/cgi-bin/disk/rd/mmc | gzip -c vim3_raw_mmc_image.img.gz
   wget http://192.168.1.150/cgi-bin/disk/rd/mmc -O- | gzip -c vim3_raw_mmc_image.img.gz


device block name mode examples

   wget http://172.22.1.1/cgi-bin/disk/rd/dev/sda
   wget http://172.22.1.1/cgi-bin/disk/rd/dev/mmcblk1

## more access info

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

## write mode WIP

    ....

