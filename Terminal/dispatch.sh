#!/bin/bash

if [ "$1" -eq 1 ] ; then

	exec $HOME/.Terminal/EnvCPP.sh $2 $3 ;
fi

if [ "$1" -eq 2 ] ; then

	exec $HOME/.Terminal/EnvZig.sh $2 $3 ;
fi

exit 0
