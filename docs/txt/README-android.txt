# Krescue - android dump minimize prepare

    DATA=data
    MNT=/mnt/$DATA.loop
    aml_partitions -m=$DATA
    fsck.ext4 -f $MNT
    S=
    while [ ! "$S" ] ; do
	S=$(resize2fs -M $MNT 2>&1 | grep already); S=${S#*already }; S=${S%% *}
    done