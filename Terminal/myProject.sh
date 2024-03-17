#!/bin/sh
# $1 project
# $2 directory
f_cls() {

reset > /dev/null
	echo -en '\033[1;1H'
	echo -en '\033]11;#000000\007'
	echo -en '\033]10;#FFFFFF\007'
}

cd $2
nohup  $HOME/.Terminal/TermHX  $1 $2 > /dev/null 2>&1 &

#exit 0
