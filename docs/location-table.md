# SPI flash locations table descriptions

one block=1024*32 bytes, all parts padded by this block

DTB + SCRIPT + UENV + ENV - allways have fixed position

|  type  |  size  | padded | offset | in hex | blocks| files |
| ------ | ------ | ------ | ------ | ------ | ----- | ----- | 
|   UBOOT| 1310720| 1310720|       0|       0|  40|./scripts/../share/u-boot.bin |
|     DTB|  131072|  131072| 1310720|0x140000|   4|./scripts/../share/linux.dtb  |
|  SCRIPT|     758|   32768| 1441792|0x160000|   1|/tmp/krescue.script.scr       |
|    UENV|   32768|   32768| 1474560|0x168000|   1|/tmp/krescue.uboot.env        |
|    LOGO|   28264|   65536| 1507328|0x170000|   2|./scripts/../share/splash.bmp.gz|
|  UIMAGE| 5973461| 6094848| 1572864|0x180000| 186|./scripts/../share/uImage     |
| UINITRD| 5038144| 5046272| 7667712|0x750000| 154|./scripts/../share/uInitrd    |
|     ENV|   65536|   65536|16711680|0xFF0000|   2|-                             |
