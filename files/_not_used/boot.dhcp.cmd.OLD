#!script

## hyphop ##

#= uboot script boot rescue system from DHCP+TFTP

LOADER="tftp"

echo "**KRESCUE LOAD FROM $BOOTED**"
echo "**KRESCUE LOAD FROM DHCP**"

ENV_OFFHEX=0x168000
LOGO_OFFHEX=0x168000

echo "load env"
$LOADER  $ENV_OFFHEX /rescue/80_user_env.txt
echo env import -t $ENV_OFFHEX $filesize
env import -t $ENV_OFFHEX $filesize

#echo "load dtb to $dtb_mem_addr"
#$LOADER $dtb_mem_addr /rescue/linux.dtb
#fdt addr $dtb_mem_addr

echo "load logo"
$LOADER  $LOGO_OFFHEX /rescue/splash.bmp.gz
bmp display $LOGO_OFFHEX 0 0

echo "load kernel"
$LOADER  $UIMAGE_ADDR /rescue/uImage

echo "load initrd"
$LOADER  $UINITRD_ADDR /rescue/uInitrd

setenv bootargs ${bootargs} ${cmdline} ${rescue_custom} loaded="tftp" booted="$BOOTED"

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

echo "[i] sleep 1 sec Ctrl+C for break boot"

sleep 1

echo bootm $UIMAGE_ADDR $UINITRD_ADDR
bootm $UIMAGE_ADDR $UINITRD_ADDR


echo ooooopsss

##END##
