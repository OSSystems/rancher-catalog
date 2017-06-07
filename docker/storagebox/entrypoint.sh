#!/bin/sh

umount_storagebox() {
    umount /var/lib/rancher/volumes/storagebox
    exit 0
}

trap 'kill ${!}; umount_storagebox' SIGUSR1
trap 'kill ${!}; umount_storagebox' SIGTERM

mkdir -p /var/lib/rancher/volumes/storagebox

mount.cifs \
    -o user=$USERNAME,pass=$PASSWORD \
    //$USERNAME.your-storagebox.de/backup \
    /var/lib/rancher/volumes/storagebox

while true
do
    tail -f /dev/null & wait ${!}
done
