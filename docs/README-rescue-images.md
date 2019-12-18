# Krescue OS installation images for emmc

## NAME spec

    DEVICE.LABEL.[SIZE-bytes.].emmc.FORMAT

### DEVICE
    
    VIM1|VIM2|VIM3|VIM3L|VIMx

### LABEL

    os label

### SIZE

    SIZE - is total bytes for unpacked image
    
### FORMAT

    kresq | sfs | zip | zst | zstd | gz

+ kresq, sfs - its krescue images
+ zip | zst | gz - packed raw images suitable for dd usage

## Examples

+ VIM3L.Ubuntu.4294967296-bytes.emmc.gz

    Ubuntu Image for VIM3L board , raw image packed by gzip

+ VIM2.Android.4294967296-bytes.emmc.zst

    Android Image for VIM2 board , raw image packed by zstd

+ VIMx.OpenWrt.emmc.kresq

    Openwrt Image for all boards, krescue image
