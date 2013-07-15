#!/bin/bash

if [[ "$(whoami)" != 'root' ]]
then
    echo "You are not running this as sudo!  D= "
    echo "Use 'sudo ./3ljzacDevApache.sh "
    exit
fi

if [[ -d "/etc/apache2/" ]]
    then
        echo "Looking for ljzac.dev config file . . ."
    if [[ -f "./ljzac.dev"  ]]
    then
        echo "File found... "
        echo "Installing ljzac.dev Config file "
        cp ljzac.dev /etc/apache2/sites-available/
        cd /etc/apache2/sites-enabled/; ln -s -T ../sites-available/ljzac.dev ljzac.dev
        echo "Adding domain to '/etc/hosts/'"
        echo '127.0.0.1      ljzac.dev' | cat - /etc/hosts > temp && mv temp /etc/hosts
        if [[ -L "/etc/apache2/sites-enabled/ljzac.dev" ]]
        then
           echo "All izz well!"
           echo "Restart apache!!! with:"
           echo " 'sudo service apache2 restart '"
           echo "=)"
        else
           echo "Something went wrong. Check for the '/etc/apache2/sites-available/ljzac.dev' file"
           echo "If you have it you should make a symlink by hand (from /etc/apache2/sites-enabled/) and all will be ok with:"
           echo "'ln -s -T ../sites-available/ljzac.dev ljzac.dev'"
        fi
    else
        echo "File NOT Found! Verify you have 'ljzac.dev' file here"
        exit
    fi
    echo "Finished =)"
    exit

else
    echo " '/etc/apache2/' NOT Found. Sure apache is installed?? "
    echo "Try running 'sudo apt-get install apache2'"
    exit
fi

exit
