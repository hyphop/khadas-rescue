#!script

## hyphop ##

#= LIBREELEC RUN example

#setenv bootargs root=/dev/ram0 rw init=/init panic=10 net.ifnames=0 loglevel=3 console=tty0 console=ttyS0,115200n8 
#no_console_suspend consoleblank=0 

setenv bootargs $bootargs boot=LABEL=LIBREELEC disk=LABEL=STORAGE loglevel=8 console=ttyAML0,115200n8 console=tty0
setenv bootargs $bootargs vout=${outputmode},enable hdmitx=${cecconfig},${colorattribute} hdmimode=${hdmimode} cvbsmode=${cvbsmode}
setenv bootargs $bootargs osd_reverse=${osd_reverse} video_reverse=${video_reverse} jtag=${jtag} reboot_mode=${reboot_mode} ddr_size=${ddr_size}

echo BOOT_OS


KERNEL_ADDR=0x50000000

echo ext4load mmc 1:7 $KERNEL_ADDR /KERNEL
ext4load mmc 1:7 $KERNEL_ADDR /KERNEL
echo ext4load mmc 1:7 ${dtb_mem_addr} /dtb/meson-g12b-khadas-vim3.dtb
ext4load mmc 1:7 ${dtb_mem_addr} /dtb/meson-g12b-khadas-vim3.dtb

echo $bootargs

echo WAIT_2_SEC

sleep 2

echo booti $KERNEL_ADDR
booti $KERNEL_ADDR

sleep 1000

##END##

