#!/bin/sh
#= update boot.sd.scr from boot.sd.cmd source
mkimage -C none -A arm -T script -d boot.sd.cmd boot.sd.scr

