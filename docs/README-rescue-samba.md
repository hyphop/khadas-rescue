# KRESCUE and SAMBA NETWORK SHARES USAGE

we can use Samba networks share for dump / restore images and install kresq images

# PREPARE

need create special FOLDER on Krescue SD card second partition root folder

    samba-IP-SHARENAME

where

    IP        - is share server ip adress or hostname
    SHARENAME - share name 

NOTE: we can make several folders


# EXAMPLES

    samba-192.168.0.1-myshare
    samba-10.10.10.1-krescue
    samba-home-tmp

# USAGE

when special SD folder was created - just start krescue from sd

    MENU -> emmc write \
    MENU -> emmc dump  -> select your folder samba-IP-SHARENAME

# NOTES

1) krescue mount shares automaticly to samba-IP-SHARENAME folders
2) all shares must be without password and have RW mode if u neen dump images

# manual mount remount shares

    MENU -> advanced  -> unmount dump storage
		      \  mount dump storages

