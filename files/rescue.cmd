#!script

## hyphop ##

#= uboot script boot rescue system from spi / sd / emmc / dhcp / hook

# chck mainline uboot
#fdtcontroladdr


## PREPARE

    kbi hwver

    echo "** KRESCUE START hwver: $hwver hostname: $hostname maxcpus: $maxcpus fdt: $fdtfile source: $boot_source:$BOOTED**"

    setenv ENV_ADDR 0x32000000
    setenv Cenv     /rescue/80_user_env.txt

    test "X$devtype" = "X" && devtype=mmc

## FIND rescue source if devnum undefined

    echo "[i] scan rescue device"

	for d in 0 1 2 1:5; do
	    if test "X$devnum" = "X"; then
	    echo "[i] scan rescue device $d test $devnum"
	    fatload $devtype $d $ENV_ADDR $Cenv && setenv devnum $d
	    fi
	done

    setenv LOADER "fatload $devtype $devnum"

    echo "[i] rescue loaded $LOADED"

    setenv Cdtb     /rescue/linux.dtb
    setenv Csplash  /rescue/splash.bmp.gz
    setenv Csplash2 /rescue/splash.bmp.2.gz
    setenv CuInitrd /rescue/uInitrd
    setenv CuImage  /rescue/uImage
    setenv CImage   /rescue/Image
    setenv Cdtb     /rescue/krescue-vim.dtb

if test "$hwver" = ""; then
    echo "[w] hwver not defined"
else 
    test "$hwver" = "VIM1.V12" && setenv Cdtb /rescue/krescue-vim1.dtb
    test "$hwver" = "VIM1.V13" && setenv Cdtb /rescue/krescue-vim1.dtb
    test "$hwver" = "VIM1.V14" && setenv Cdtb /rescue/krescue-vim1.dtb
    test "$hwver" = "VIM2.V12" && setenv Cdtb /rescue/krescue-vim2.dtb
    test "$hwver" = "VIM2.V14" && setenv Cdtb /rescue/krescue-vim2.dtb
    test "$hwver" = "VIM3.V10" && setenv Cdtb /rescue/krescue-vim3-s922x.dtb
    test "$hwver" = "VIM3.V11" && setenv Cdtb /rescue/krescue-vim3-a311d.dtb
fi

if test "$maxcpus" = ""; then
    echo "[w] maxcpus not defined"
    test "$hostname" = "arm_gxbb" && setenv Cdtb /rescue/krescue-vim3-s905d3.dtb
    test "$hostname" = "KVIM3" && setenv Cdtb /rescue/krescue-vim3-a311d.dtb
    test "$hostname" = "kVIM1" && setenv Cdtb /rescue/krescue-vim1.dtb
    test "$hostname" = "KVim" && setenv Cdtb /rescue/krescue-vim1.dtb
else
    echo "[w] detect by maxcpus -$maxcpus-"
    test "$maxcpus" = "4" && setenv Cdtb /rescue/krescue-vim1.dtb
    test "$maxcpus" = "4" && test "$hwver" = "VIM3.V12" && setenv Cdtb /rescue/krescue-vim3-s905d3.dtb
    test "$maxcpus" = "6" && setenv Cdtb /rescue/krescue-vim3-a311d.dtb
    test "$maxcpus" = "8" && setenv Cdtb /rescue/krescue-vim2.dtb
fi

## emmc MAINLINE UBOOT 
test "$fdtfile" = "amlogic/meson-sm1-khadas-vim3l.dtb" && setenv Cdtb /rescue/krescue-vim3-s905d3.dtb
test "$fdtfile" = "amlogic/meson-gxl-s905x-khadas-vim.dtb" && setenv Cdtb /rescue/krescue-vim1.dtb
test "$fdtfile" = "amlogic/meson-gxm-khadas-vim2.dtb" && setenv Cdtb /rescue/krescue-vim2.dtb
test "$fdtfile" = "amlogic/meson-g12b-a311d-khadas-vim3.dtb" && setenv Cdtb /rescue/krescue-vim3-a311d.dtb

VENDOR_=""

test "$fdtfile" = "rockchip/rk3399-khadas-edge-v.dtb" && setenv Cdtb /rescue/krescue-edge.dtb && VENDOR_=rockchip
test "$fdtfile" = "rockchip/rk3399-khadas-edge-captain.dtb" && setenv Cdtb /rescue/krescue-edge.dtb && VENDOR_=rockchip
test "$fdtfile" = "rockchip/rk3399-khadas-edge.dtb" && setenv Cdtb /rescue/krescue-edge.dtb && VENDOR_=rockchip

test "$boot_source" = "" || setenv BOOTED $boot_source

if test "$Cdtb" = "/rescue/krescue-vim.dtb"; then
    echo "[w] dtb not detected force use static: $Cdtb"
fi

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

echo "**KRESCUE LOAD by $LOADER FROM // $BOOTED+$BOOTED2 post: $BOOT_HOOK // $hwver // ${hwver}**"


##############################################################

echo "load env"
echo "$LOADER $ENV_ADDR $Cenv"

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


if test "$fdtfile" = "" ; then

echo "load logo"
echo $LOADER $LOGO_ADDR $Csplash
$LOADER $LOGO_ADDR $Csplash

if bmp display $LOGO_ADDR m m; then 
    echo "BMP OK"
else
    echo "BMP KO"
    echo $LOADER $LOGO_ADDR $Csplash2
    $LOADER $LOGO_ADDR $Csplash2
    echo unzip $LOGO_ADDR $LOGO_ADDR2
    unzip $LOGO_ADDR $LOGO_ADDR2
fi

fi

test "$fdt_addr_r"     = "" || setenv DTB_ADDR     $fdt_addr_r
test "$ramdisk_addr_r" = "" || setenv UINITRD_ADDR $ramdisk_addr_r
test "$kernel_addr_r"  = "" || setenv UIMAGE_ADDR  $kernel_addr_r

echo "addrs:  UIMAGE_ADDR ::  UINITRD_ADDR ::  DTB_ADDR"
echo "addrs: $UIMAGE_ADDR :: $UINITRD_ADDR :: $DTB_ADDR"
echo "setenv kernel_addr_r $kernel_addr_r; setenv ramdisk_addr_r $ramdisk_addr_r; setenv fdt_addr_r $fdt_addr_r;"

echo ":::::::::::::::"

echo "load dtb"

echo $LOADER $DTB_ADDR $Cdtb
$LOADER $DTB_ADDR $Cdtb
fdt addr $DTB_ADDR || exit 1
#

SPI_=spifc
test "$VENDOR_" = "" || SPI_=spi1
fdt set $SPI_ status okay

echo "load packed initrd"
echo $LOADER $UINITRD_ADDR $CuInitrd
$LOADER $UINITRD_ADDR $CuInitrd


setenv bootargs "${cmdline} ${rescue_custom} booted=$BOOTED hwver=$hwver"

CONSOLE_="console=ttyAML0,115200n8 console=ttyS0,115200n8"

test "$VENDOR_" = "" || CONSOLE_="console=uart8250,mmio32,0xff1a0000"

setenv bootargs "${bootargs} console=tty0 $CONSOLE_ no_console_suspend consoleblank=0"
setenv bootargs "${bootargs} vout=${outputmode},enable hdmitx=${cecconfig},${colorattribute}"
setenv bootargs "${bootargs} hdmimode=${hdmimode} cvbsmode=${cvbsmode} osd_reverse=${osd_reverse}"
setenv bootargs "${bootargs} video_reverse=${video_reverse} jtag=${jtag} reboot_mode=${reboot_mode} ddr_size=${ddr_size}"

setenv bootargs "${bootargs} dtb=$Cdtb"

# autodetect fix green
osd12=
test "$fdtfile" = "" || osd12=osd12
setenv bootargs "${bootargs} $osd12 samba-usb-krescue"

#fdt addr ${dtb_mem_addr};
#fdt resize 65536
#fdt set /adc_keypad key_val <120>
fdt rm /partitions;

#echo "activate emmc before run"
#mmc dev 1
#mmc info

## RESCUE

echo "[i] bootargs: $bootargs"
echo "[i] bootcmd:  $bootcmd"

#echo "[i] sleep 2 sec Ctrl+C for break boot"
#sleep 2 || exit 1

echo "load packed kernel"

echo "try:: $LOADER $UIMAGE_ADDR $CImage"

$LOADER $UIMAGE_ADDR $CImage && echo "booti $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR" && booti $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR

echo bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR
echo $LOADER $UIMAGE_ADDR $CuImage
$LOADER $UIMAGE_ADDR $CuImage
bootm $UIMAGE_ADDR $UINITRD_ADDR $DTB_ADDR

echo oooopsss

sleep 1

##END##

