# Krescue vim1 uboot - boot from dhcp tftp

```
dhcp ; setenv BOOTED2 dhcp ; tftp 1000000 boot.scr ; source 1000000
or
dhcp ; setenv BOOTED2 dhcp ; tftp 1000000 boot.scr ; script 1000000
or
dhcp ; setenv BOOTED2 dhcp ; tftp 1000000 boot.scr ; autoscr 1000000


```


