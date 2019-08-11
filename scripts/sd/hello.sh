#!/bin/sh

## hyphop ##

#= run hello script from sd - simple example for rescue custom usage 

#/ USAGE
#  edit 80_user_env.txt file next line
#  rescue_custom="... script=sd:hello.sh"

MSG="[i] simple message from sd '$0' script at $(date)"

logger -t RESCUE "$MSG"

echo "$MSG"

