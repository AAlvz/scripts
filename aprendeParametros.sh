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
#       --- To get the incoming parameter by position.
#
#    $* --- Returns all your parameters in a single string
#                ("$1, $2 .... $n")
#
#    $@ --- Returns all your parameters as a sequence of strings
#                ("$1", "$2", ... "$n")
#
#    $0 --- Refers to the name of the script itself. 
#    
#    $# --- Returns the number of arguments specified via command line
#
#    $USER --- Returns actual user
#
#   
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
