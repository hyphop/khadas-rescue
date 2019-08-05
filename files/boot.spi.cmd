#!script

## hyphop ##

#= uboot script boot rescue system from spi flash

## PREPARE

### fixed
ENV_SIZHEX=0x008000
ENV_OFFHEX=0x168000

SPI_HZ=104000000

echo "[i] sf probe $SPI_HZ"
sf probe 0 $SPI_HZ

#already readed
#echo "[i] load dtb"
#sf read ${addr_dtb} $DTB_OFFHEX $DTB_SIZHEX

echo "load env"
echo sf read $ENV_OFFHEX $ENV_OFFHEX $ENV_SIZHEX
sf read $ENV_OFFHEX $ENV_OFFHEX $ENV_SIZHEX
echo env import -t $ENV_OFFHEX $ENV_SIZHEX
env import -t $ENV_OFFHEX $ENV_SIZHEX

echo "load logo"
echo sf read $LOGO_OFFHEX $LOGO_OFFHEX $LOGO_SIZHEX
sf read $LOGO_OFFHEX $LOGO_OFFHEX $LOGO_SIZHEX
bmp display $LOGO_OFFHEX 0 0

echo "load kernel"
echo sf read $UIMAGE_ADDR $UIMAGE_OFFHEX $UIMAGE_SIZHEX
sf read $UIMAGE_ADDR $UIMAGE_OFFHEX $UIMAGE_SIZHEX

echo "load initrd"
echo sf read $UINITRD_ADDR $UINITRD_OFFHEX $UINITRD_SIZHEX
sf read $UINITRD_ADDR $UINITRD_OFFHEX $UINITRD_SIZHEX

setenv bootargs ${bootargs} ${cmdline} ${rescue_custom}

setenv bootargs ${bootargs} console=tty0 console=ttyS0,115200n8 no_console_suspend consoleblank=0
setenv bootargs ${bootargs} vout=${outputmode},enable hdmitx=${cecconfig},${colorattribute}
setenv bootargs ${bootargs} hdmimode=${hdmimode} cvbsmode=${cvbsmode} osd_reverse=${osd_reverse}
setenv bootargs ${bootargs} video_reverse=${video_reverse} jtag=${jtag} reboot_mode=${reboot_mode} ddr_size=${ddr_size}

## RESCUE

echo "bootm $UIMAGE_ADDR $UINITRD_ADDR"

echo "[i] bootargs: $bootargs"
echo "[i] bootcmd:  $bootcmd"

echo "activate emmc before run"

mmc dev 1

sleep 1

bootm $UIMAGE_ADDR $UINITRD_ADDR

echo ooooopsss

sleep 10000

##END##

