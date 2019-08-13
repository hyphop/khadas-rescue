# krescue SPI and eMMC SD disks

NOTE: eMMC + SPI flash cant work at same time

plz activate by one!

+ `spi on`	- enable spi
+ `spi off`	- disable spi
+ `mmc on`	- enable mmc + sd
+ `mmc off`	- disable mmc + sd

+ `spi off; spi on` same as `spi reload`
+ `mmc off; mmc on` same as `mmc reload`

## force SPI usage - disable SD and eMMC - example

```
root@Krescue:/# mmc off ; spi re
[i] /opt/mmc on
[i] /opt/mmc - status | USAGE /opt/mmc [on|off]
[i] disabled - meson_gx_mmc
[i] mmc not found
[i] /opt/spi - status | USAGE /opt/spi [on|off]
[i] enabled  - spi_meson_spifc
[i] enabled  - m25p80
[i] mtd parts
dev:    size   erasesize  name
mtd0: 01000000 00001000 "spi0.0"

```
## use SPI + SD

```
root@Krescue:/# mmc off; spi re; mmc on 
[i] /opt/mmc on
[i] /opt/mmc - status | USAGE /opt/mmc [on|off]
[i] disabled - meson_gx_mmc
[i] mmc not found
[i] /opt/spi - status | USAGE /opt/spi [on|off]
[i] enabled  - spi_meson_spifc
[i] enabled  - m25p80
[i] mtd parts
dev:    size   erasesize  name
mtd0: 01000000 00001000 "spi0.0"
[i] /opt/mmc on
[i] /opt/mmc - status | USAGE /opt/mmc [on|off]
[i] enabled  - meson_gx_mmc
SD
 179       0 mmcblk0 1 0 8 2 0 0 0 0 0 4 0 0 0 0 0
 179       1 mmcblk0p1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
```

## SD + eMMC usage

root@Krescue:/# spi off ; mmc re
[i] /opt/spi on
[i] /opt/spi - status | USAGE /opt/spi [on|off]
[i] disabled - spi_meson_spifc
[i] disabled - m25p80
[i] mtd parts
dev:    size   erasesize  name
[i] /opt/mmc - status | USAGE /opt/mmc [on|off]
[i] enabled  - meson_gx_mmc
/sys/class/mmc_host/mmc0/mmc0:aaaa/type:SD
/sys/class/mmc_host/mmc1/mmc1:0001/type:MMC
 179       0 mmcblk0 1 0 8 1 0 0 0 0 0 8 0 0 0 0 0
 179       1 mmcblk0p1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 179      32 mmcblk1 2 0 16 345 0 0 0 0 0 12 340 0 0 0 0
 179      96 mmcblk1boot1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 179      64 mmcblk1boot0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

