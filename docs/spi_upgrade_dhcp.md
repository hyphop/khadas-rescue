# SPI flash upgrade example via DHCP + TFTP

we can use dhcp + tftp for upload files and boot systems ... ,
just connect your working machine and device board by ethernet cable.
start `../scrips/net_tftp_server` - this script which share `../share/`
working dir for tftp dhcp uploads

## USAGE EXAMPLES

### full spi flash upgrade

1) prepare boot.scr just run `share/dhcp.upgrade_spi_flash.make`
2) run it `../scrips/net_tftp_server`

reboot device in uboot-dhcp mode

if u have legacy uboot u press any key in UART serial terminal
for stop normal boot process, and type this command line

    dhcp; tftp 0 boot.scr; autoscr 0

if u have advanced uboot from krescue already, just press 
middle hot key for activate dhcp+ftp mode

after what we can see this output in serial-uart console

```
Speed: 1000, full duplex
Using dwmac.ff3f0000 device
TFTP from server 192.168.100.1; our IP address is 192.168.100.121
Filename 'boot.scr'.
Load address: 0x0
Loading: #
done
Bytes transferred = 442 (1ba hex)
## Executing script at 00000000
[i] DHCP boot script 
[i] full spi flash write
[i] sf probe 104000000
SF: Detected W25Q128FW with page size 256 Bytes, erase size 4 KiB, total 16 MiB
[i] load spi image
Speed: 1000, full duplex
Using dwmac.ff3f0000 device
TFTP from server 192.168.100.1; our IP address is 192.168.100.121
Filename 'image.spi.bin'.
Load address: 0x1000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ##########################
         18.1 MiB/s
done
Bytes transferred = 12779520 (c30000 hex)
loaded c30000 bytes to 1000000
write it
sf update 1000000 0 c30000
Updating, 86% 61117 B/s
....
12189696 bytes written, 589824 bytes skipped in 214.758s, speed 61146 B/s
END

```

OK well done spi is upgraded, got to the next step ...

## setup bootmode u-boot from SPI

    kbi bootmode w spi
    kbi poweroff    

