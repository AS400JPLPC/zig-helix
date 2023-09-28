#!/bin/sh
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


f_readPos() {	#commande de positionnement	lines + coln + text 
	echo -en '\033[0;0m'
	let lig=$1
	let col=$2
	let colR=$2+${#3}+1  # si on doit coller faire  $2+${#3}
	echo -en '\033['$lig';'$col'f'$fdVert$faGras$fcBlanc$3 
	echo -en '\033[0;0m' 
	tput cnorm	# curseur visible         			
 	echo -en '\033['$lig';'$colR'f'$faGras$fcGreen
	read   
	tput civis 	# curseur invisible
	echo -en '\033[0;0m'			  
}

f_dsplyPos(){ #commande de positionnement	lines + coln + couleur + text
	echo -en '\033[0;0m'
	let lig=$1
	let col=$2
	echo -en '\033['$lig';'$col'f'$3$4

}

# resize 
printf '\e[8;'12';'80't'

choix=""
PATH_FILE=""

while [ "$choix" != "q" ]
do

f_cls
	f_dsplyPos  1  24 $faGras$fcBleu '----------------------------------------'
	
	f_dsplyPos  3  20 $faGras$fcGreen 'Path :'$1


	f_dsplyPos  5  20 $faGras$fcRouge 'q -> exit'


	f_readPos   7  20 'Path source  :'; path=$REPLY;

	f_readPos   8  20 'Name source  :'; name=$REPLY;

	if [ "$path" == "q" -o "name" == "q" ] ; then 
		break;
	fi

	if [ "$path" == "" -o  "$name" == "" ] ; then 
		f_readPos 10 50  'erreur de saisie Enter'
	else

		PATH_FILE=$1"/"$path"/"$name

		if test -f $PATH_FILE; then

			f_dsplyPos  10  1 "Print.: "$faGras$fcJaune$PATH_FILE"\n";
 			enscript -1rG --line-numbers -p $1/print/$name.ps --highlight=zig --color=1 -c  $PATH_FILE  --borders --highlight-bar-gray=gray --word-wrap 
			f_pause
	
			break;
		else
			f_dsplyPos 10 1  'the file is invalid >'$faGras$fcJaune$PATH_FILE"\n"
			f_pause
		fi

	fi
done

tput cnorm
exit 0
