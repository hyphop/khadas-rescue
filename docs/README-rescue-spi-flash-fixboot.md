# SPI flash reset/ignore boot from SPI flash

if we have some boot trubles from spi flash like a loops freeze etc..
just poweroff, short CS and GND pins (1 + 4 pins) on spi-flash, poweron. 
OK we booted from emmc or sd! ...


```
 spi flash pinout
       ___________
1 CS  * @         * VCC    5
2 DO  *           * HOLD   6
3 WP  * w25q128   * CLOCK  7
4 GND *___________* DI     8

```

