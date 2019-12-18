# Krescue bootmode

we can change boot sequence to SPI flash or MMC via `bootmode` command

NOTE: spi mode acive but not have valid bootloader try next mmc or sd
NOTE: MMC mode acive but not have valid bootloader on emmc try next sd
NOTE: SPI -> eMMC -> SD

+ `bootmode` - read write bootmode like uboot kbi bootmode 

# examples

+ bootmode [get]       - get active mode from ( spi | mmc )
+ bootmode spi save    - set spi mode and activate via poweroff
+ bootmode mmc save    - set mmc mode and activate via poweroff
+ bootmode toogle save - toggle mode change from active to another
+ bootmode help        - display help

