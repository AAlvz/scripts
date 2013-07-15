#!/bin/bash
#ESTE SCRIPT ES UN MINIFICADOR DE JAVASCRIPT

if [[ $# == 0 || $# == 2 || $# > 3 ]]
then
    echo "You are not using the script the way you should"
    echo " ./compressJS.sh ['install' | 'compress /OriginRute/file.js /Minimalized/Rute/' ]   (La segunda contiene el .min.js) "
    read -n1 -r -p "Entendido? Instalar o comprimir? Presiona una tecla"
    exit
fi

if [[ $1 == "install" ]]
    then
    if type "java" 2>&1;
    then
	read -n1 -r -p "Java existe, podemos proceder . . . Presiona cualquier tecla."; echo "---Se descargara el compilador---";
	mkdir /home/$USER/closureCompiler/ && cd /home/$USER/closureCompiler && wget http://closure-compiler.googlecode.com/files/compiler-latest.zip;
	cd /home/$USER/closureCompiler && unzip compiler-latest.zip -d closure-compiler; cd /home/$USER/closureCompiler/closure-compiler/ && chmod o+r compiler.jar;
	exit
    else
	read -n1 -r -p "Java no existe, es necesario instalarlo . . . Presiona cualquier tecla . . . por favor"
	while true; do
	    read -p "Deseas instalar Java ?? [Y|N] : " yn
	    case $yn in
		[Yy]* ) sudo apt-get install openjdk-7-jre -y ; echo -e "Se instaló todo bien? \n "; echo "Usa el script otra vez para verificar"; echo "o usa: "; echo "sudo apt-get install openjdk-7-jre"; break;;
		[Nn]* ) echo "Ok... aqui le dejamos..."; echo "Si quieres instalar usa: sudo apt-get install openjdk-7-jre"; exit;;
	    esac
	done
	exit
    fi
fi

if [[ $# == 3 ]]
    then
    if [[ $1 == "compress" && -f $2 && -d $3 ]]
        then 
	java -jar /home/$USER/closureCompiler/closure-compiler/compiler.jar --js $2 --js_output_file $3/custom.min.js
	if [[ -f $3/custom.min.js ]]
	    then
	    read -n1 -r -p "Todo resultó bien! Verifica el archivo comprimido! .. Y presiona una tecla."
	else
	    read -n1 -r -p "Algo salió Mal al comprimir ..  presiona una tecla."
	fi
    else
	echo "Un error ha sucedido. Verifica:"
	echo "primer parámetro: install o compress"
	echo "Segundo parámetro: ARCHIVO.js"
	echo "Tercer parámetro: RUTA al archivo.min.js"
	exit
    fi
fi
