#!script

## hyphop ##

#= uboot script boot rescue system from spi flash

## PREPARE

#ENV_ADDR

SPI_HZ=104000000

setenv LOADER "sf read"

echo "**KRESCUE LOAD by $LOADER  FROM // $BOOTED // $hwver **"
echo "[i] sf probe $SPI_HZ"
sf probe 0 $SPI_HZ

echo "load env"
### fixed
setenv ENV_SIZHEX 0x008000
setenv ENV_OFFHEX 0x168000
echo $LOADER $ENV_OFFHEX $ENV_OFFHEX $ENV_SIZHEX
$LOADER $ENV_OFFHEX $ENV_OFFHEX $ENV_SIZHEX || exit 
echo env import -t $ENV_OFFHEX $ENV_SIZHEX
env import -t $ENV_OFFHEX $ENV_SIZHEX || exit 

echo "[i] reload load dtb"
sf read $DTB_ADDR $DTB_OFFHEX $DTB_SIZHEX
fdt addr $DTB_ADDR || exit

echo "load logo"
echo $LOADER $LOGO_OFFHEX $LOGO_OFFHEX $LOGO_SIZHEX
$LOADER $LOGO_OFFHEX $LOGO_OFFHEX $LOGO_SIZHEX
bmp display $LOGO_OFFHEX 0 0

echo "load packed kernel"
echo $LOADER $UIMAGE_ADDR $UIMAGE_OFFHEX $UIMAGE_SIZHEX
$LOADER $UIMAGE_ADDR $UIMAGE_OFFHEX $UIMAGE_SIZHEX || exit 

echo "load packed initrd"
echo $LOADER $UINITRD_ADDR $UINITRD_OFFHEX $UINITRD_SIZHEX
$LOADER $UINITRD_ADDR $UINITRD_OFFHEX $UINITRD_SIZHEX || exit 

setenv bootargs "${cmdline} ${rescue_custom} booted=$BOOTED hwver=$hwver"
setenv bootargs "${bootargs} console=tty0 console=ttyAML0,115200n8 console=ttyS0,115200n8 no_console_suspend consoleblank=0"
setenv bootargs "${bootargs} vout=${outputmode},enable hdmitx=${cecconfig},${colorattribute}"
setenv bootargs "${bootargs} hdmimode=${hdmimode} cvbsmode=${cvbsmode} osd_reverse=${osd_reverse}"
setenv bootargs "${bootargs} video_reverse=${video_reverse} jtag=${jtag} reboot_mode=${reboot_mode} ddr_size=${ddr_size}"

#echo "activate emmc before run"
#mmc dev 1
#mmc info

## RESCUE

echo "[i] bootargs: $bootargs"
echo "[i] bootcmd:  $bootcmd"

echo "[i] sleep 1 sec Ctrl+C for break boot"
# sleep 1

echo bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR
bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR

echo oooopsss

sleep 1

##END##

