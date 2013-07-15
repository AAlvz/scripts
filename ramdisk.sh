#!/bin/bash

if [[ $# > 1 || $# == 0 ]]
    then
    echo "RUN AS SUDO SUDO SUDO"
    echo "You are not using the script the way you should"
    echo " ./ramdisk.sh ['mount' | 'unmount']  "
    echo " =)"
    exit
fi

if [[ $1 == "mount" ]]
    then
    echo "Mounting Ramdisk"
    mkdir /tmp/ramdisk1G; chmod 777 /tmp/ramdisk1G
    mount -t tmpfs -o size=1024M tmpfs /tmp/ramdisk1G/


else if [[ $1 == "umount" ]]
    then
    echo "I'm trying to unmount"
    umount /tmp/ramdisk1G; rm -r /tmp/ramdisk1G
    echo "Done. Check for /tmp/ramdisk1G . Should not be there"
    fi
fi
exit
