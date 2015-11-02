#!/bin/bash

#first grep is the name of device, second to check it is a keyboard
xinput -list | grep -i trulyergonomic | grep -i keyboard | awk -F= {'print $2'} | awk '{print $1}' |
xargs -I num setxkbmap -device num -layout us
