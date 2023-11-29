#!/bin/sh
# $1 directory
# $2 project
f_cls() {

reset > /dev/null
	echo -en '\033[1;1H'
	echo -en '\033]11;#000000\007'
	echo -en '\033]10;#FFFFFF\007'
}


nohup  $HOME/.Terminal/TermHX  $2 $1 & 
f_cls
exit 0
