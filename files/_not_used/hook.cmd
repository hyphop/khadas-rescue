#!script

## hyphop ##

#= uboot script boot rescue system from SD via default uboot
#! OS dtb boot problem with lagacy android uboot

test "X$devtype" = "X" && devtype=mmc
test "X$devnum" = "X" && devnum=0

#LOADER="fatload mmc 0"
setenv LOADER "fatload $devtype $devnum"

setenv FROM sd

echo "**KRESCUE HOOKED by $LOADER  FROM // $BOOTED / $FROM // $hwver **"

# main line reserverd mem
#ENV_OFFHEX=0x168000
#LOGO_OFFHEX=0x168000

setenv ENV_OFFHEX 0x20000000
setenv LOGO_OFFHEX 0x30000000

echo "load env"
$LOADER $ENV_OFFHEX /rescue/80_user_env.txt
echo env import -t $ENV_OFFHEX $filesize
env import -t $ENV_OFFHEX $filesize

if test 0 = 1; then

# uboot diff 
test "X$dtb_mem_addr" = "X" && dtb_mem_addr=$fdt_addr_r
test "X$dtb_mem_addr" = "X" && dtb_mem_addr=$DTB_ADDR

echo "load dtb to $dtb_mem_addr"
echo $LOADER $dtb_mem_addr /rescue/linux.dtb
$LOADER $dtb_mem_addr /rescue/linux.dtb
fdt addr $dtb_mem_addr

fi

echo $LOADER $DTB_ADDR /rescue/linux.dtb
$LOADER $DTB_ADDR /rescue/linux.dtb

echo "load logo"
echo $LOADER $LOGO_OFFHEX /rescue/splash.bmp.gz
$LOADER $LOGO_OFFHEX /rescue/splash.bmp.gz
bmp display $LOGO_OFFHEX 0 0

echo "load initrd"
echo $LOADER $UINITRD_ADDR /rescue/uInitrd
$LOADER $UINITRD_ADDR /rescue/uInitrd

setenv bootargs "${cmdline} ${rescue_custom} booted=$BOOTED from=$FROM hwver=$hwver"
setenv bootargs "${bootargs} console=tty0 console=ttyAML0,115200n8 console=ttyS0,115200n8 no_console_suspend consoleblank=0"
setenv bootargs "${bootargs} vout=${outputmode},enable hdmitx=${cecconfig},${colorattribute}"
setenv bootargs "${bootargs} hdmimode=${hdmimode} cvbsmode=${cvbsmode} osd_reverse=${osd_reverse}"
setenv bootargs "${bootargs} video_reverse=${video_reverse} jtag=${jtag} reboot_mode=${reboot_mode} ddr_size=${ddr_size}"

#echo "activate emmc before run"
#mmc dev 1
#mmc info

## RESCUE

echo "bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR"

echo "[i] bootargs: $bootargs"
echo "[i] bootcmd:  $bootcmd"

echo "[i] sleep 1 sec Ctrl+C for break boot"

echo "load packed kernel"
echo $LOADER $UIMAGE_ADDR /rescue/uImage
$LOADER $UIMAGE_ADDR /rescue/uImage
echo bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR
bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR

echo oops try another boot

echo "booti $IMAGE_ADDR $UINITRD_ADDR $DTB_ADDR"

sleep 100

##END##
