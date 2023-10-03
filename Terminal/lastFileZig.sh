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

PROJECT=$1

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
 pos=0
 rm -f $HOME/.cache/helix/grepa.txt
 rm -f $HOME/.cache/helix/grepb.txt

 grep  'file'  $HOME/.cache/helix/archiveFile.log | cut  -d" " -f3 >> $HOME/.cache/helix/grepa.txt

# grep  "$1"  $HOME/.cache/helix/grepa.txt | cut  -d" " -f2 >> $HOME/.cache/helix/grepb.txt


#retrieve last enrg.
 tail -n 1  $HOME/.cache/helix/grepa.txt >> $HOME/.cache/helix/grepb.txt
>$HOME/.cache/helix/grepa.txt

#retrieve nbr occurence
nbr=$(grep  -o -i  '/' $HOME/.cache/helix/grepb.txt | wc -l)

#retieve directory
rep=/$(grep  'file' $HOME/.cache/helix/grepb.txt | cut  -d"/" -f2-$nbr) 


>$HOME/.cache/helix/grepa.txt
# name source
let "nbr= $nbr+1"
let "pos= $nbr+2"


grep  'file' $HOME/.cache/helix/grepb.txt | cut  -d"/" -f$nbr-$pos >>  $HOME/.cache/helix/grepa.txt
name=$(grep  'zig'  $HOME/.cache/helix/grepa.txt | cut  -d"/" -f1)

 rm -f $HOME/.cache/helix/grepa.txt
 rm -f $HOME/.cache/helix/grepb.txt

 # call last directory  HELIX

 exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar    --geometry="129x42"  --font="Noto Sans Mono  Regular 15" --default-working-directory=$rep   --title="PROJECT : "$PROJECT -x helix $name 
exit 0
