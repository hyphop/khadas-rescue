# how to extract files from backup image EXAMPLE

1) u have VIM2.*.img.zstd dont touch it store it to secure place 
2) zstd -dc < VIM2.*.img.zstd > VIM2.raw.emmc.img
3) work only with upacked image VIM2.*.img 

```
LOOP=$(losetup --show -o 188743680 -f VIM2*.img)
mkdir rootfs
sudo mount $LOOP rootfs
```

OK! check our files

```
ls -l1 rootfs/
total 72
drwxr-xr-x   2 root root 4096 Dec 28 00:11 bin
drwxr-xr-x   3 root root 4096 Dec 31 02:25 boot
drwxr-xr-x   2 root root 4096 Dec 31 02:22 dev
lrwxrwxrwx   1 root root   25 Dec 31 02:24 dtb.img -> /boot/dtb/kvim2_linux.dtb
drwxr-xr-x 127 root root 4096 Dec 31 02:22 etc
drwxr-xr-x   3 root root 4096 Dec 31 02:24 home
drwxr-xr-x  20 root root 4096 Dec 31 02:22 lib
drwxr-xr-x   2 root root 4096 Dec 27 23:56 media
drwxr-xr-x   2 root root 4096 Dec 27 23:56 mnt
drwxr-xr-x   2 root root 4096 Dec 27 23:56 opt
drwxr-xr-x   2 root root 4096 Apr 24  2018 proc
drwx------   2 root root 4096 Dec 31 02:24 root
drwxr-xr-x   2 root root 4096 Dec 31 02:22 run
drwxr-xr-x   2 root root 4096 Dec 31 02:24 sbin
drwxr-xr-x   2 root root 4096 Dec 27 23:56 srv
drwxr-xr-x   2 root root 4096 Apr 24  2018 sys
drwxrwxrwt   2 root root 4096 Dec 31 02:24 tmp
lrwxrwxrwx   1 root root   13 Dec 31 02:24 uInitrd -> /boot/uInitrd
drwxr-xr-x  10 root root 4096 Dec 27 23:56 usr
drwxr-xr-x  11 root root 4096 Dec 27 23:56 var
lrwxrwxrwx   1 root root   12 Dec 31 02:24 zImage -> /boot/zImage
```
