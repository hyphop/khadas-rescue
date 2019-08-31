#!script

# boot_hook for rescue boot if file /rescue/boot.sd.scr will be finded on SD card
# add this into uboot -> board_later_init // run_command_list(THIS_SCRIPT_STRINGS,-1,0);

# plz dont use local vars on this stage
setenv SCRIPT_ADDR 0x50000000
setenv BOOT_HOOK /rescue/boot.sd.scr
setenv POST_HOOK "script $SCRIPT_ADDR || autoscr $SCRIPT_ADDR; sleep 1"

if fatload mmc 0 $SCRIPT_ADDR $BOOT_HOOK; then
    setenv bootcmd $POST_HOOK
    exit 0
fi
if ext4load mmc 0 $SCRIPT_ADDR $BOOT_HOOK; then
    setenv bootcmd $POST_HOOK
    exit 0
fi
