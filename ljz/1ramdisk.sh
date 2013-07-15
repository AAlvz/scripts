#!/bin/bash

if [[ "$(whoami)" != 'root' ]]
   then
   echo "You are not running this as sudo!  D= "
   echo "Use 'sudo ./1ramdisk.sh ['mount' | 'unmount']' "
   exit
fi

if [[ $# > 1 || $# == 0 ]]
    then
    echo "You are not using the script the way you should"
    echo "Use 'sudo ./1ramdisk.sh ['mount' | 'unmount']' "
    echo " =)"
    exit
fi

if [[ $1 == "mount" ]]
    then
    echo "Mounting Ramdisk"
    mkdir /tmp/ramdisk1G; chmod 777 /tmp/ramdisk1G
    mount -t tmpfs -o size=2048M tmpfs /tmp/ramdisk1G/
    if [[ -d /tmp/ramdisk1G ]]
    then
       echo "All izz well!!"
       echo " Ramdisk Created succesfully ! !"
    else
       echo "Something went wrong!"
       echo "Runned as sudo?"
       echo "Try again! S= "
    fi


else if [[ $1 == "umount" ]]
    then
    echo "I'm trying to unmount"
    umount /tmp/ramdisk1G; rm -r /tmp/ramdisk1G
    echo "Done. Check for /tmp/ramdisk1G . Should not be there"
    fi
fi
exit
