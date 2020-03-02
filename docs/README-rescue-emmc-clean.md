# internal EMMC clean

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


