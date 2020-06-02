#!script

echo "====================================="
echo "TFTP_DHCP_TEST $LOADHOST => $loadhost"
echo "====================================="

sleep 1

#dhcp $loadhost:uboot3.bin && go $loadaddr

if dhcp $loadhost:uboot.VIM3.spi.bin ; then

 echo REWRITE_SPI_UBOOT 
 sf probe
 md5sum $loadaddr $filesize

 echo "SPI ERASE PLZ WAIT"
# sf erase 0 +$filesize
 echo "SPI UPDATE"
 sf update $loadaddr 0 $filesize
 echo "DONE"
 sf read $loadaddr 0 $filesize
 md5sum $loadaddr $filesize

fi
#dhcp $loadhost:uboot.bin && go $loadaddr

