# Krescue vim1 uboot - manual boot from sd

if system not started from sd try force stop uboot (press any key to UART console)
test next commands

```
fatload mmc 0 100000 s905_autoscript && autoscr 100000 || source 100000 # vim1 boot from sd
fatload mmc 1 100000 s905_autoscript && autoscr 100000 || source 100000
fatload mmc 2 100000 s905_autoscript && autoscr 100000 || source 100000

```

## android

``
kvim#mmc list
SDIO Port B: 0
SDIO Port C: 1

kvim#rsvmem dump 
[rsvmem] reserved memory:
[rsvmem] bl31 reserved memory start: 0x05000000
[rsvmem] bl31 reserved memory size:  0x00300000
[rsvmem] bl32 reserved memory start: 0x00000000
[rsvmem] bl32 reserved memory size:  0x00000000


``

## vim1 - system fail - wrong dtb detected

```
Starting kernel ...

uboot time: 835367581 us
[    0.176235] psci: failed to boot CPU4 (-22)
[    0.176253] CPU4: failed to boot: -22
[    0.208282] psci: failed to boot CPU5 (-22)
[    0.208298] CPU5: failed to boot: -22
[    0.240329] psci: failed to boot CPU6 (-22)
[    0.240345] CPU6: failed to boot: -22
[    0.272379] psci: failed to boot CPU7 (-22)
[    0.272394] CPU7: failed to boot: -22
```
