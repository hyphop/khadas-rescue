# Krescue SD card change bootloader

no need rewrite krescue SD image if u need bootup from other VIM device
u can change bootloader to proper device at any time

    # mount sd rescue partition
    cd /rescue/extra
    sh ./boot_vim3l.sh # change boot to VIM3L
    sh ./boot_vim3.sh  # change boot to VIM3
    sh ./boot_vim2.sh  # change boot to VIM2
    sh ./boot_vim1.sh  # change boot to VIM1

## EXAMPLES

### change bootloader to VIM3L

```
... rescue/extra$ sh ./boot_vim3l.sh
[i] auto detect mounted to >> /dev/mmcblk0 <<
[i] krescue change sd boot to vim3l
cat: /sys/class/block/mmcblk0/device/model: No such file or directory
[i] wite u-boot ./../u-boot.vim3l.sd.bin to dev /dev/mmcblk0 ()
[i] are u sure ? press any key or Ctrl+C for escape

[i] OK burn it ;)
[#] sudo dd if=./../u-boot.vim3l.sd.bin of=/dev/mmcblk0 conv=fsync,notrunc bs=444 count=1
[sudo] password for master: 
1+0 records in
1+0 records out
444 bytes copied, 0.00395345 s, 112 kB/s
[#] sudo dd if=./../u-boot.vim3l.sd.bin of=/dev/mmcblk0 conv=fsync,notrunc bs=512 skip=1 seek=1
2500+1 records in
2500+1 records out
1280368 bytes (1.3 MB, 1.2 MiB) copied, 0.248481 s, 5.2 MB/s
[i] OK bootable changed to vim3l
```
