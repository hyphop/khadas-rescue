# krescue SPI flash freq

w25q128 can work at 104Mhz


```
time dd if=/dev/mtd0 bs=4096 of=/dev/null
4096+0 records in
4096+0 records out
real    0m 3.88s
user    0m 0.00s
sys     0m 3.84s

``

## spi flash type

    m25p80 spi0.0: w25q128fw (16384 Kbytes)

## SPI flash read speed

    16384 / 3.5 = 4681 / 1024 = 4.5 Mbytes by sec !!!!


