#!/bin/bash

if [ "$1" -eq 1 ] ; then

	exec xfce4-terminal -x $HOME/.Terminal/EnvCPP.sh $2 $3
fi

if [ "$1" -eq 2 ] ; then

	exec xfce4-terminal -x $HOME/.Terminal/EnvZig.sh $2 $3

fi

exit 0
