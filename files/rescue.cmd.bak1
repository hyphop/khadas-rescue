#!script

## hyphop ##

#= uboot script boot rescue system from spi / sd / emmc / dhcp / hook

## PREPARE

    setenv ENV_ADDR 0x32000000

    test "X$devtype" = "X" && devtype=mmc
    test "X$devnum" = "X" && devnum=0
    setenv LOADER "fatload $devtype $devnum"

    setenv Cenv     /rescue/80_user_env.txt
    setenv Cdtb     /rescue/linux.dtb
    setenv Csplash  /rescue/splash.bmp.gz
    setenv CuInitrd /rescue/uInitrd
    setenv CuImage  /rescue/uImage
    setenv CImage   /rescue/Image

    setenv Cdtb     /rescue/krescue-vim2.dtb

test "$hwver" = "" && setenv Cdtb /rescue/krescue-vim1.dtb
test "$hwver" = "VIM1.V12" && setenv Cdtb /rescue/krescue-vim1.dtb
test "$hwver" = "VIM1.V13" && setenv Cdtb /rescue/krescue-vim1.dtb
test "$hwver" = "VIM1.V14" && setenv Cdtb /rescue/krescue-vim1.dtb
test "$hwver" = "VIM2.V14" && setenv Cdtb /rescue/krescue-vim2.dtb
test "$hwver" = "VIM3.V10" && setenv Cdtb /rescue/krescue-vim3-s922x.dtb
test "$hwver" = "VIM3.V11" && setenv Cdtb /rescue/krescue-vim3-a311d.dtb

if test "$BOOT_HOOK" = ""; then
if test "$BOOTED" = "spi"; then

    setenv SPI_HZ 104000000
    setenv LOADER "sf read"
    echo "[i] sf probe $SPI_HZ"
    sf probe 0 $SPI_HZ

    setenv ENV_OFFHEX 0x168000
    setenv ENV_SIZHEX 0x008000

    setenv Cenv     $ENV_OFFHEX $ENV_SIZHEX

fi
fi

if test "$BOOTED2" = "dhcp"; then
    setenv LOADER tftp
    setenv Cenv   /rescue/80_user_env.txt
fi

echo "**KRESCUE LOAD by $LOADER FROM // $BOOTED+$BOOTED2 post: $BOOT_HOOK // $hwver**"


##############################################################

echo "load env"
echo $LOADER $ENV_ADDR $Cenv

setenv filesize $ENV_SIZHEX
$LOADER $ENV_ADDR $Cenv || exit
echo env import -t $ENV_ADDR $filesize
env import -t $ENV_ADDR $filesize || exit

if test "$BOOT_HOOK" = ""; then
if test "$BOOTED" = "spi"; then
if test "$BOOTED2" != "dhcp"; then

    setenv Cdtb     $DTB_OFFHEX $DTB_SIZHEX
    setenv Csplash  $LOGO_OFFHEX $LOGO_SIZHEX
    setenv CuInitrd $UINITRD_OFFHEX $UINITRD_SIZHEX
    setenv CuImage  $UIMAGE_OFFHEX $UIMAGE_SIZHEX
    setenv CImage   $IMAGE_OFFHEX $IMAGE_SIZHEX

fi
fi
fi

##############################################################

echo "load dtb"
echo $LOADER $DTB_ADDR $Cdtb
$LOADER $DTB_ADDR $Cdtb
fdt addr $DTB_ADDR || exit 1
#
fdt set spifc status okay

echo "load logo"
echo $LOADER $LOGO_ADDR $Csplash
$LOADER $LOGO_ADDR $Csplash
bmp display $LOGO_ADDR 0 0

echo "load packed initrd"
echo $LOADER $UNITRD_ADDR $CuInitrd
$LOADER $UINITRD_ADDR $CuInitrd

echo "load packed kernel"
echo $LOADER $UIMAGE_ADDR $CuImage
$LOADER $UIMAGE_ADDR $CuImage

setenv bootargs "${cmdline} ${rescue_custom} booted=$BOOTED hwver=$hwver"
setenv bootargs "${bootargs} console=tty0 console=ttyAML0,115200n8 console=ttyS0,115200n8 no_console_suspend consoleblank=0"
setenv bootargs "${bootargs} vout=${outputmode},enable hdmitx=${cecconfig},${colorattribute}"
setenv bootargs "${bootargs} hdmimode=${hdmimode} cvbsmode=${cvbsmode} osd_reverse=${osd_reverse}"
setenv bootargs "${bootargs} video_reverse=${video_reverse} jtag=${jtag} reboot_mode=${reboot_mode} ddr_size=${ddr_size}"

setenv bootargs "${bootargs} dtb=$Cdtb"

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

