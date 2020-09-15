#!/bin/zsh
#
DIR_=$1
echo "Im dir_show_script! dir = ${DIR_}"
echo "I use for command shell:"
PID_MY_SHELL="$(echo "$$")"

ps "${PID_MY_SHELL}" | tail -1 | cut -b 29-38


cd ${DIR_}


N="$(find . -maxdepth 1 -name "* *" | wc -l)"
echo "${N}"
if [ ${N} -gt 0 ]
then
	STR="$(find . -name "* *" | sed 's!.*/!!')"

	COUNTER=0
    while [  $COUNTER -lt ${N} ]; do
        #echo The counter is $COUNTER
        let COUNTER=COUNTER+1
        file "$(echo "${STR}" | sed -n -e ${COUNTER}p)"
    done

	
else
	echo "No files with spaces! "
fi




if [ -z $2 ]
	then
	file $( ls -LA -1 -I "* *" ${DIR_}) 
else
	file $( ls -LA -1 -I "* *" ${DIR_})  | grep $2: 
fi


echo END!
