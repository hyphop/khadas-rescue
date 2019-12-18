# Krescue SD card change boot

no need rewrite krescue SD image if u need bootup from other VIM device
u can change boot to proper device at any time

    # mount sd rescue partition
    cd /rescue/extra
    sh ./boot_vim3l #	change boot to VIM3L
    sh ./boot_vim3  #	change boot to VIM3
    sh ./boot_vim2  #	change boot to VIM2
    sh ./boot_vim1  #	change boot to VIM1

