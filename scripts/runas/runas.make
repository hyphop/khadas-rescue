#!/bin/sh

## hyphop ##

cd $(dirname $0)

echo "[i] $0">&2

[ -d ../bin ] || mkdir -p ../bin

gcc runas.c -o ../bin/runas && {

    ./runas.prepare ../bin/runas 2>/dev/null || {
	echo "[i] run via SUDO" >&2
	sudo ./runas.prepare
    }

}

gcc runasg.c -o ../bin/runasg && {

    ./runas.prepare ../bin/runasg 2>/dev/null || {
	echo "[i] run via SUDO" >&2
	sudo ./runas.prepare
    }

}