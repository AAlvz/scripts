#!/bin/bash

echo "Remember to Run this as your Git user"
if [[ $# > 1 || $# == 0 ]]
then
    echo "You are not using the script the way you should"
    echo " ./2cloneljzac.sh ['ssh' | 'https']  "
    echo " =)"
    exit
fi

if [[ -d /tmp/ramdisk1G ]]
then 
   echo "There is the ram already created =) ... You shall pass..."
else
   echo "You shall not pass"
   echo "Create Your Ramdisk."
   echo "Use: 'sudo ./1ramdisk.sh mount'"
   exit
fi

if [[ $1 == "ssh" ]]
    then
    echo "Folder /tmp/ramdisk1G found."
    echo "Cloning repo with ssh"
    cd /tmp/ramdisk1G; git clone git@github.com:ljzac/ljzac.github.io.git
    echo " =)"
    echo "ahora corre jkl para agregar '_sites' ! "
    exit

else
    echo "Folder /tmp/ramdisk1G found."
    echo "Cloning repo with 'https'"
    cd /tmp/ramdisk1G; git clone https://github.com/ljzac/ljzac.github.io.git
    echo " =)"
    echo "Now will run jkl to create /_site !"
    ../jkl
    if [[ -d /tmp/ramdisk1G/ljzac.github.io/_site/ ]]
    then
        echo "jkl runned correctly! =)"
        echo "Proceed to run the last script"
    else
        echo "jkl did NOT ran in the correct way. Do it manually."
    fi
    exit

fi

exit
