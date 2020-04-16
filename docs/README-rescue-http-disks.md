# READ WRITE disk data by http

We can very ease dump and restore images or install any kresq image by network.
Vim device must be started from krescue sd and stay in one local network with your

## READ data disk by http

Read from mmc / sd / spi / sdc ..... device disk

### examples

download by url via your favotite browser or downloader

+ http://krescue.local/api/disk/read/mmc	# raw image
+ http://krescue.local/api/disk/read/mmc.zst	# compressed
+ http://krescue.local/api/disk/read/mmc.gz	# compressed by gz

### NOTES

+ we can replace krescue.local to krescue or krescue.lan or valid krescue IP address
+ mdns krescue.local hostname can resolved to USB_IP same as ETH_IP
+ USB_NET is about 15-20MB/s transfer speed
+ ETH_NET 100Mbit mode is  about 10MB/s transfer speed
+ ETH gigabit lan (VIM2 VIM3 VIM3L) is about 110MB/s transfer speed

### Wget / Curl usage

    wget http://krescue.local/api/disk/read/mmc
    wget http://172.22.1.1/api/disk/read/sd
    curl -L http://krescue.local/api/disk/read/mmc.zst -o vim3_raw_mmc_image.bin.zst
    curl -L http://krescue.local/api/disk/read/mmc.zst -O
    curl -L http://krescue.local/api/disk/read/mmc > myimage.img
    wget http://192.168.1.150/api/disk/read/mmc -O vim3_raw_mmc_image.bin

## next example download only 4M emmc of image

    wget http://krescue.lan/api/disk/read/mmc:5M
    > VIM2.1586162412.5M.emmc.img

device block name mode examples

    wget http://172.22.1.1/api/disk/read/dev/sda
    wget http://172.22.1.1/api/disk/read/dev/mmcblk1

### more access info

    mmc1		-> mmc part 1
    mmc2		-> mmc part 2
    sd			-> sd
    sd1			-> sd part 1
    sd2			-> sd part 2
    dev/mmcblk1p1	-> /dev/mmcblk1p1
    dev/mmcblk1p1	-> /dev/mmcblk1p1
    dev/sda		-> /dev/sda
    dev/sdb		-> /dev/sdb

## WRITE data to disk by http

write to mmc / sd / spi / sdc ..... device disk

    http://krescue.local/api/disk/write

### Curl usage

    # raw image
    curl -L --data-binary @IMG       HOST/api/disk/write/mmc

    # compressed stream
    curl -L --data-binary @IMG.gz    HOST/api/disk/write/mmc.gz
    curl -L --data-binary @IMG.xz    HOST/api/disk/write/mmc.xz
    curl -L --data-binary @IMG.zst   HOST/api/disk/write/mmc.zst
    curl -L --data-binary @IMG.kresq HOST/api/disk/write/mmc.kresq

### more examples

fastest way write image direct to emmc by net (USB|ETH)

    curl -L --data-binary @VIM*.img.zst       krescue.local/api/disk/write/mmc.zst
    curl -L --data-binary @$(ls VIM*.img.zst) krescue.local/api/disk/write/mmc.zst
    curl -L --data-binary @VIM*.img           krescue.local/api/disk/write/mmc

### HTTP RESPONSE

```
POST
/dev/mmcblk2
zstd
application/x-www-form-urlencoded
585052120
0
```
