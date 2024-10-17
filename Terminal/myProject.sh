#!/bin/sh


# $1 project
# $2 directory



f_cls() {

reset > /dev/null
	echo -en '\033[1;1H'
	echo -en '\033]11;#000000\007'
	echo -en '\033]10;#FFFFFF\007'
}

#=========================
# Func clear cache
#=========================
folder_cache=$2".zig-cache"

if test -d "$folder_cache" ; then
	rm -r $folder_cache
fi

#=========================
# Call Terminal VTE
#=========================
cd $2
nohup  $HOME/.Terminal/TermHX  $1 $2 > /dev/null 2>&1 &

#exit 0
