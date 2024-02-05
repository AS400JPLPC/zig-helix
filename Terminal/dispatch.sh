#!/bin/bash

if [ "$1" -eq 1 ] ; then

	exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar -T "Compile-C/CC" -x  $HOME/.Terminal/EnvCPP.sh $2 $3 
fi

if [ "$1" -eq 2 ] ; then

	exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar  -T "Compile-ZIG" -x   $HOME/.Terminal/EnvZig.sh $2 $3 

fi

exit 0
