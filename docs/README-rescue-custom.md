# Rescue custom usage

## rescue_custom env usage

all envs located in /rescue/80_user_env.txt or /rescue/*_env.txt
edit this var rescue_custom="....."

    # example 
    rescue_custom="ap_ssid=VIM3 ap_passw=12345678 wifi_mode=client wifi_ssid=VIM_5G wifi_passw=11112222"

## vars names and descriptions

    password=	- [ROOT_PASSWORD] - by default its empty
    hostname=	- [HOST_NAME] - system hostname 
    wifi_ssid=	- [SSID] - client mode wifi net name 
    wifi_pass=	- [PASSWORD] - client mode wifi password 
    wifi_mode=  - [client|ap|2|5] - client(station) mode | ap mode | ap in legacy 2.4G mode | ap in 5G ac mode
    ap_ssid=	- [SSID] - ap mode wifi net name - by default is same hostname
    ap_pass=	- [PASSWORD] - ap mode wifi password - by default is 12345678
    script=	- run post scripts, multi usage 
    otg=	- usb mode mode [ether|ether_gw|storage] - by default is ether

### post script

    /rescue/scripts - post scripts folder SD card at fist partition

before run all script copied from SD to /tmp/postscripts/SD
NOTE: on script run stage SD card umounter already!

### post scripts examples

   # run one scripts /rescue/scripts/one.sh
   script=sd:hello.sh

   # run several scripts
   script=sd:hello.sh script=sd:test.sh

   # run several scripts by mask
   script=sd:*.sh

   # run remote scripts
   script=script=https://github.com/hyphop/khadas-rescue/scripts/http/test.sh


## post scripts log 

all post script logged into /tmp/postscripts/logs

    $ cat /tmp/postscripts/logs/hello.log
    [i] simple message from sd '/tmp/postscripts/SD/hello.sh' script at Tue Aug  6 13:22:24 UTC 2019
