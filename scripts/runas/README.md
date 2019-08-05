# runas exec program as another USER or GROUP / UID GID

exec program as another USER or GROUP / UID GID
its like sudo but work without password prompt

## Usage

    runas path_to_prog [ prog_args ]
    runasg path_to_prog [ prog_args ]


## setup UID / GID

    UID=1 GID=2 runas path_to_prog [ prog_args ]
    GID=2 runasg path_to_prog [ prog_args ]

## Note

path_to_prog must be real real path to program not just prog name

## Build && Prapare

    ./runas.make

## Files

* ../bin/runas
* ./runas.test.env
* ./runas.test.id
* ./runas.test.iptables

## Examples

### ./runas.test.id - check id

    runas $(which id)

    > uid=0(root) gid=1000(master) groups=1000(master),3(sys),4(adm),24(cdrom),27(sudo),29(audio),30(dip),46(plugdev),110(netdev),118(lpadmin),128(sambashare)


### ./runas.test.iptables - print iptables rules

    runas $(which iptables) -L

### ./runas.test.env - print env

    runas $(which env)

## AUTHOR

    ## hyphop ##
