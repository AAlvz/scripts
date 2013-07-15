#!/bin/bash
# Utilizar para recuerpar Notas.
# ./recuperaNotas.sh [hash]

if [[ $# > 1 || $# == 0 ]]
    then
    echo "Ya sabes el hash a tu última revision?"
    echo "Utiliza bien el comando."
    echo "./recuperaNotas.sh [hash]"
    exit
fi

if [[ $# == 1 ]]
    then
    echo "Regresando Notas anteriores . . . . . Espera . . "
    cd /tmp/ramdisk1G/ljzac.github.io 
    git pull && cp -r /tmp/ramdisk1G/ljzac.github.io/ /tmp/ramdisk1G/ljz_back
    cd /tmp/ramdisk1G/ljz_back && git checkout HEAD && git reset --hard $1
    echo ". . . . . . . . . ."
    echo "EN ESTE MOMENTO SE DEBEN DE VER LOS ARCHIVOS"
    echo ". . . . . . . . . ."
    find /tmp/ramdisk1G/ljz_back/_posts/ -type d | sort
    echo "Restaurando todo a /tmp/ .. .. .. .. "
    cp -r /tmp/ramdisk1G/ljz_back/* /tmp/ramdisk1G/ljzac.github.io/
    cd /tmp/ramdisk1G/ljzac.github.io/ && git add . && git commit -am "Recuperando archivos hasta la revison $1" && git pull && git push;
    
fi
