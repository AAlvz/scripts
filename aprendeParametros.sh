#!/bin/bash
# In: Any number of arguments.
# Process: To understand the use of arguments in .sh 
# Out: Explained parameters

# USE: $ ./aprendeScripts.sh parametro1 param2 param3

######################################################################
#
#             VARIABLES YOU WILL NEED:
#
#
#    $1, $2 ... $n
#          --- To get the incoming parameter by position.
#
#    $*    --- Returns all your parameters in a single string
#                ("$1, $2 .... $n")
#
#    $@    --- Returns all your parameters as a sequence of strings
#                ("$1", "$2", ... "$n")
#
#    $0    --- Refers to the name of the script itself.
#
#    $#    --- Returns the number of arguments specified via command line
#
#    $USER --- Returns actual user
#
#    $?    --- Returns last exit status
######################################################################


#//////////////////////////////////////////////////////////////////////////
#
#            ///   CHMOD   ///
#
#        You need to give execute permissions to the file to use it as a script
#
#      Run it is simple:
#                $ chmod [permission] [file]
#     example    $ chmod 555 scriptname.sh
#
#     The permissions:
#
#             555 --- Gives everyone read/execute permission
#             +rx --- Gives everyone read/execute permission
#            u+rx --- Gives only the script owner read/execute permission
#             a-x --- Deny execute permissions to everyone
#
#           ___________________________________________
#      W/Letters
#      (user+permission)
#        USER
#           u   --- User  | The user who owns it
#           g   --- Group | The users in the file's Group
#           o   --- Other | Other users not in the group
#           a   --- All   | All users
#
#        PERMISSION
#           r   --- Read
#           w   --- Write
#           x   --- Execute (or access direcotries)
#           X   --- Execute only if the file is a directory
#           s   --- Set User or group ID execution
#           t   --- Saver on swap device
#           u   --- The current permissions of the current user
#           g   --- The permissions of the group
#           o   --- Permissions of the other users
#
#/////////////////////////////////////////////////////////////////////////

##### DEFINING VARIABLES   ######
VAR=1
echo $VAR THE USER IS $USER AND HOST IS $HOSTNAME

#### NUMERICAL VARIABLES ####
let A=100
let B=10
let C=$A+$B
echo El numero A es: $A sumado mas 10 es $A+$B osea $C

echo There are $# parameters to $0 in a single string: $*
echo first parameter: $1
echo Second parameter: $2
echo Third parameter: $3
echo Here they are in a sequence of strings: $@

echo "Cheers =)"

function how_many {
    echo "$# arguments in here."
}

how_many "$*"
how_many "$@"

## MAKE SURE TO RUN AS SUDO
if [[ "$(whoami)" != 'root' ]]
   then
   echo "You are not running this as sudo!  D= "
   exit
fi

##############
# ## COLORS! #
##############

#Will Print Red
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 1) # Red
echo “Welcome to ${txtred} red Text ${txtrst}!”

txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White

# tput setab [1-7] : Set a background colour using ANSI escape
# tput setb [1-7] : Set a background colour
# tput setaf [1-7] : Set a foreground colour using ANSI escape
# tput setf [1-7] : Set a foreground colour

# tput Text Mode Capabilities:

# tput bold : Set bold mode
# tput dim : turn on half-bright mode
# tput smul : begin underline mode
# tput rmul : exit underline mode
# tput rev : Turn on reverse mode
# tput smso : Enter standout mode (bold on rxvt)
# tput rmso : Exit standout mode
# tput sgr0 : Turn off all attributes

##############
# End Colors #
##############

######################
#
#  FILE TEST OPERATORS
#  http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
#
######################

if [ -r $file ]
then
    echo "File has read access"
else
    echo "File does not have read access"
fi

# [ -a FILE ]True if FILE exists.
# [ -d FILE ]True if FILE exists and is a directory.
# [ -e FILE ]True if FILE exists.
# [ -f FILE ]True if FILE exists and is a regular file.
# [ -h FILE ]True if FILE exists and is a symbolic link.
# [ -r FILE ]True if FILE exists and is readable.
# [ -s FILE ]True if FILE exists and has a size greater than zero.
# [ -u FILE ]True if FILE exists and its SUID (set user ID) bit is set.
# [ -w FILE ]True if FILE exists and is writable.
# [ -x FILE ]True if FILE exists and is executable.
# [ -O FILE ]True if FILE exists and is owned by the effective user ID.
# [ -G FILE ]True if FILE exists and is owned by the effective group ID.
# [ -L FILE ]True if FILE exists and is a symbolic link.
# [ -N FILE ]True if FILE exists and has been modified since it was last read.
# [ -S FILE ]True if FILE exists and is a socket.

######################
#
# END OF FILE TEST OPERATORS
#
######################
