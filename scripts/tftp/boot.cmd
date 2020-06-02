#!script

LOADHOST=peace

echo dns $LOADHOST loadhost
dns $LOADHOST loadhost

loadhost=172.23.0.140
startscript=boot.test.cmd

echo "dhcp $loadaddr $loadhost:$startscript && script"
dhcp $loadaddr $loadhost:$startscript && script 

echo BOOT_DHCP_END


