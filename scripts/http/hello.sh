#!/bin/sh

## hyphop ##

#= run http script - simple example for rescue custom usage 

#/ USAGE
#  edit 80_user_env.txt file next line
#  rescue_custom="... script=https://github.com/hyphop/khadas-rescue/scripts/http/test.sh ..."

MSG="[i] simple message from http '$0' script at $(date)"

logger -t RESCUE "$MSG"

echo "$MSG"

