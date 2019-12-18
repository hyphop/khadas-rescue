# Krescue - access

## root access

+ ttyAM0 / ttyS0 - serial console (UART) - root without password
+ ssh root@krescue.local -p 22

## device ip

+ 172.22.1.1 - usb0 / otg
+ dhcp - eth0
+ mdns => krescue.local

## web interface

+ http://krescue.local		- web interface 
+ http://krescue.local:8088     - web root shell console

## IR RC control

+ khadas rc control

## USB uinput

+ any usb keyboard
+ xbox360

## HDMI

+ tty0 -> HDMI