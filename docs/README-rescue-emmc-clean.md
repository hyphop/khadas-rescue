# internal EMMC cleanup from bootloader

## under ANDROID shell need root (su)

    su
    b=/dev/block/mmcblk0
    for o in ${b}boot0 ${b}boot1 $b; do
     dd if=/dev/zero count=666 of=$o
    done

same in one-line

    su; b=/dev/block/mmcblk0; for o in ${b}boot0 ${b}boot1 $b; do dd if=/dev/zero count=666 of=$o; done

## UBOOT command line

legacy uboot

    store init 3

mainline uboot

    mmc dev 2 && mmc erase 0 666

## linux

    echo "fast clear amlogic boot areas">&2
    echo 0 | tee /sys/block/mmcblk?/mmcblk?boot?/force_ro > /dev/null
    C="dd if=/dev/zero count=666"
    for d in /dev/mmcblk?boot?;do
    $C of=$d 2>/dev/null
    done
    $C of=${d%boot*} 2>/dev/null

## krescue

    mmc_erase

or

    mmc_boot_erase
