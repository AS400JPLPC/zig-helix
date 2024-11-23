#!/bin/bash

if [ "$1" -eq 1 ] ; then

	gnome-terminal --hide-menubar  --title="Compile-C/CC"  --  $HOME/.Terminal/EnvCPP.sh $2 $3

fi

if [ "$1" -eq 2 ] ; then

	gnome-terminal --hide-menubar  --title="Compile-ZIG"   --  $HOME/.Terminal/EnvZig.sh $2 $3 

fi


if [ "$1" -eq 3 ] ; then

	gnome-terminal --hide-menubar ---title="Compile-ZIG"   --  $HOME/.Terminal/EnvLibZig.sh $2 $3 

fi

if [ "$1" -eq 4 ] ; then

	gnome-terminal --hide-menubar  --title="Compile-OutZIG"   --  $HOME/.Terminal/OutZig.sh $2 $3 

fi
exit 0
