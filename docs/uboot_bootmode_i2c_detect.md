# uboot bootmode i2c detect 

#= uboot_bootmode_i2c_detect

simple check for mmm

    MM=0x50000000; i2c read 18 20 1 $MM; md.b $MM 1; itest.b *$MM == "0x01" && echo MMC

or print name 

    MM=0x50000000; i2c read 18 20 1 $MM; if itest.b *$MM == "0x01"; then BOOT0=mmc ; else BOOT0=spi; fi; echo $BOOT0

or via env func

    setenv boot_prio "MM=0x50000000; i2c read 18 20 1 $MM; if itest.b *$MM == "0x01"; then BOOT0=mmc ; else BOOT0=spi; fi; echo $BOOT0"
    run boot_prio

# more examples

    kbi bootmode w spi
    run boot_prio
    > spi

    kbi bootmode w emmc
    run boot_prio
    > mmc

