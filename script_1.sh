#!/bin/zsh
#
DIR_=$1
echo "Im dir_show_script! dir = ${DIR_}"
echo "I use for command shell:"
PID_MY_SHELL="$(echo "$$")"

ps "${PID_MY_SHELL}" | tail -1 | cut -b 29-38


cd ${DIR_} 

if [ -z $2 ]
	then
	file $( ls -LA -1 ${DIR_}) 
else
	file $( ls -LA -1 ${DIR_})  | grep $2: 
fi


echo END!
