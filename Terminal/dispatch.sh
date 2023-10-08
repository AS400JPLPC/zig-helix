#!/bin/bash

echo $1
echo $2
echo $3



if [ $1 -eq "1" ] ; then

	exec $HOME/.Terminal/EnvCPP.sh $2 $3 :
fi

if [ $1 -eq 2 ] ; then
echo $1

	exec $HOME/.Terminal/EnvZig.sh $2 $3;
fi

exit 0
