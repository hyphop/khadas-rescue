# Krescue OS installation images for emmc

## NAME spec

    DEVICE.LABEL.[SIZE-bytes.].emmc.FORMAT

### DEVICE names
    
    VIM1|VIM2|VIM3|VIM3L|VIMx

+ VIM1  - vim 1		soc S905X
+ VIM2  - vim 2		soc S912
+ VIM3  - vim 3		soc A311D
+ VIM3L - vim 3 light	soc S905D3
+ VIMx  - any VIM1 VIM2 VIM3 VIM3L

### LABEL

    os label

### SIZE

    SIZE - is total bytes for unpacked image
    
### FORMAT

    kresq | sfs | zip | zst | zstd | gz

+ kresq, sfs - its krescue image suffixes
+ zip | zst | gz - packed raw images suffixes for dd usage

## Examples

+ VIM3L.Ubuntu.4294967296-bytes.emmc.gz

    Ubuntu Image for VIM3L board , raw image packed by gzip

+ VIM2.Android.4294967296-bytes.emmc.zst

    Android Image for VIM2 board , raw image packed by zstd

+ VIMx.OpenWrt.emmc.kresq

    Openwrt Image for all boards, krescue image
