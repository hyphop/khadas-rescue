
# LINUX shell write Krescue sd card image

under root

    curl -fjkL dl.khadas.com/Firmware/Krescue/dump/VIM3.krescue.sd.img.gz | gzip -dc > /dev/mmcblkX

or via sudo if u dont have root

    curl -fjkL dl.khadas.com/Firmware/Krescue/dump/VIM3.krescue.sd.img.gz | gzip -dc | sudo dd of=/dev/mmcblkX

EXAMPLES VIMs boards devices names

+ /dev/sda 		# USB FLASH / cardreader / HDD / SSD
+ /dev/sdb 		# ..................................
+ /dev/mmcblkX	# internal mmc disks /dev/mmcblk0 /dev/mmcblk1 /dev/mmcblk2

NOTE: do not write to /dev/sdx? ( /dev/sdx1 or /dev/sdx2 )
do not write to /dev/mmcblkXp? ( /dev/mmcblk1p1 /dev/mmcblk1p2 )

u can identify proper device name by one command

PROPER EXAMPLE WRITE 

    grep "" /sys/class/block/*/*/type
    # /sys/class/block/mmcblk1/device/type:SD
    # /sys/class/block/mmcblk2/device/type:MMC

    curl -fjkL dl.khadas.com/Firmware/Krescue/dump/VIM3.krescue.sd.img.gz | gzip -dc > /dev/mmcblk1 
    sync	# sync all data and drop caches
    reboot	# reboot device to krescue

## ONLINE WAY 

    curl -sL dl.khadas.com/.mega | sh -s - VIM1 VIM1.COREELEC.9.2.nightly.emmc.kresq  > /dev/mmcblk1
