# KRESCUE mega image

Krescue mega instalation image is bootable Krescue image which contain other installation images

## BUILD

    gzip -dc VIMx.krescue.sd.img.gz > VIMx.krescue.mega.images.sd.img
    cat *.kresq >> VIMx.krescue.mega.images.sd.img

VIMx.krescue.mega.images.sd.img - is mega instalation image which can writeted directly to sd card

## WRITE

    dd if=VIMx.krescue.mega.images.sd.img of=/dev/sdX

## ADVANCED USAGE

images concatenation ( mega image )
we can generate and write any images combination just use simple linux commands

next command looks like a magic...

    # generate mega image on the fly example
    ( gzip -dc VIMx.krescue.sd.img.gz ; cat *.kresq ) > VIMx.krescue.mega.images.sd.img

    # generate mega image command by command - append mode example
    gzip -dc VIMx.krescue.sd.img.gz     > VIMx.krescue.mega.images.sd.img
    cat VIM2.LAKKA.2.3.pre.emmc.kresq  >> VIMx.krescue.mega.images.sd.img
    cat VIM2.COREELEC.9.2.0.emmc.kresq >> VIMx.krescue.mega.images.sd.img
    # ....

    # generate and write mega image on the fly example
    ( gzip -dc VIMx.krescue.sd.img.gz; cat *.kresq ) | pv | sudo dd of=/dev/sdX

    # download and write images on the fly example
    (
    curl https://dl.khadas.com/Firmware/Krescue/dump/VIM3L.krescue.sd.img.gz | gzip -dc
    curl https://dl.khadas.com/Firmware/Krescue/images/VIM3L.COREELEC.9.2.0.emmc.kresq
    ) | sudo dd of=/dev/null

NOTE: Krescue system image VIMx.krescue.sd.img* must be a first ( and unpack *.gz before write )

## hyphop ##
