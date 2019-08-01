# install to spi-flash

## spi upgrade via sd card or usb-flash

    ## prerape
    DISK=/dev/sdf ## out sd card or usb-flash
    ## quick format 
    sudo dd if=/dev/zero count=1 of=$DISK
    ## create partition
    ## printf "n\np\n1\n\n+1G\nw\nq\n" | sudo fdisk /dev/sdf

wget https://github.com/hyphop/khadas-rescue/releases/download/test/u-boot.spi.bin

