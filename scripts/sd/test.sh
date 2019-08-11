#!/bin/sh

## hyphop ##

#= run test script from sd - simple example for rescue custom usage 

#/ USAGE
#  edit 80_user_env.txt file next line
#  rescue_custom="... script=sd:test.sh"

MSG="[i] simple message from '$0' script at $(date)"

logger -t RESCUE "$MSG"

echo "$MSG"
