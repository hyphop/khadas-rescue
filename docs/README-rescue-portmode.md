# Krescue bootmode

+ `portmode` - read write bootmode like uboot kbi bootmode 

# examples

+ portmode [get]       - get active mode from ( spi | mmc )
+ portmode usb save    - set spi mode and activate via poweroff
+ portmode pci save    - set mmc mode and activate via poweroff
+ bootmode toogle save - toggle mode change from active to another
+ portmode help        - display help

