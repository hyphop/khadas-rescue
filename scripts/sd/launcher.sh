#!/bin/sh

## hyphop ##

#= run launcher script from sd - simple example for rescue custom usage 

#/ USAGE
#  edit 80_user_env.txt file next line
#  rescue_custom="... script=sd:launcher.sh"

BASE=/tmp/postscripts/SD

chmod 0777 $BASE/*.sh

export PATH=$BASE:$PATH

MSG="[i] postscript launcher from $BASE"

logger -t RESCUE "$MSG"

cd $BASE

## LAUNCHER

hello.sh

## BG 

#(
#pppoe.sh
#vpn.sh
#) &

#sd2ram.sh

## END
