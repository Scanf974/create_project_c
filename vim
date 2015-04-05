#!/bin/sh

line=`cat $* | wc -l | bc`
if [ $line == "0" ] # si le fichier n'existe pas
then
	echo -e -n "\033[2A"
	echo -e -n "\033[2K\r"
	echo -e -n "\033[2A"
	vim $*
	line=`cat $* | wc -l | bc`
	if [ $line == "14" ]
	then
		echo "$*" | grep ".c$" >& /dev/null
		if [ $? == 0 ]
		then
			sed "s/\<\>/\<${PWD##*/}.h\>/g" $* > te
			cat te > $*
			rm te
			echo "$*" | grep "main.c$" >& /dev/null
        	if [ $? == 0 ]
			then
				echo "int\tmain(void)\n{\n\t\n\treturn(0);\n}" >> main.c
			fi
			vim $*
		fi
	fi
else
	vim $*
fi
