# Krescue write image to SPI flash

## write image

    mmc off # disable mmc host driver
    spi reset # activate spi flash
    spi_write /tmp/sd/rescue/krescue.spi.bin # write spi image 
    # wait about 3 min

## bootmode change

    bootmode spi save # change to spi 
    # device will poweroff
    # need manualy power on

## just one command same as prev steps

    image_rescue_write_to_spi

## go back to emmc boot

    # boot from spi
    bootmode emmc save
    # poweroff poweron
    # okay we back to boot from emmc

