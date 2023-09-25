#!/bin/sh
faStabilo='\033[7m'
fcRouge='\033[31m'
fcJaune='\033[33;1m'
fcCyan='\033[36m'
fcGreen='\033[32m'
fcBleu='\033[34m'
fcNoir='\033[0;0m'

faGras='\033[1m'
 #=========================
# function  menu
#=========================

f_cls() {

reset > /dev/null
	echo -en '\033[1;1H'
	echo -en '\033]11;#000000\007'
	echo -en '\033]10;#FFFFFF\007'	 
}

f_pause(){
	echo -en '\033[0;0m'
 	echo -en $faStabilo$fcRouge'Press[Enter] key to continue'
	tput civis 	# curseur invisible
	read -s -n 1
	echo -en '\033[0;0m'
}
f_cls

 #echo -en $faGras$fcGreen
 #echo -en "last source used\n\n"
 #echo -en '\033[0;0m'
 nbr=0 
 		nbr=$(grep -c 'store' $HOME/.cache/helix/helix.log) 

	if [ "$nbr" == 0 ] ; then

		echo -en "\nnot use source\n"

		f_pause

		exit 0
	fi 



 grep  'store'  $HOME/.cache/helix/helix.log | cut  -d" " -f11 >> $HOME/.cache/helix/grepa.txt

 grep  "$1"  $HOME/.cache/helix/grepa.txt | cut  -d" " -f11 >> $HOME/.cache/helix/grepb.txt

>$HOME/.cache/helix/grepa.txt
#retrieve last enrg.
 tail -n 1  $HOME/.cache/helix/grepb.txt >> $HOME/.cache/helix/grepa.txt


#retrieve nbr occurence
nbr=$(grep  -o -i  '/' $HOME/.cache/helix/grepa.txt | wc -l)

#retieve directory
rep="/"$(grep  'file' $HOME/.cache/helix/grepa.txt | cut  -d"/" -f4-$nbr) 

>$HOME/.cache/helix/grepb.txt
# name source
let "nbr= $nbr+2"
grep  'zig' $HOME/.cache/helix/grepa.txt | cut  -d"/" -f"$nbr",10 >> $HOME/.cache/helix/grepb.txt
name=$(grep  'zig'  $HOME/.cache/helix/grepb.txt | cut  -d"\\" -f1)

 
 rm -f $HOME/.cache/helix/grepa.txt
 rm -f $HOME/.cache/helix/grepb.txt


 # call last directory  HELIX
 cd $rep
 exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar    --geometry="129x42"  --font="Noto Sans Mono  Regular 15"  --title="PROJECT : "$1 -x helix $name

exit 0
