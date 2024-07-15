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


PROJECT=$1"_DEBUG"

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
printf '\e[8;'10';'80't'

PID=""


while [ "$PID" != "*£" ]
do

f_cls
	f_dsplyPos  1  24 $faGras$fcBleu '------Debug - codelldb---------'
	f_dsplyPos  5  20 $faGras$fcRouge 'q -> exit'

	f_readPos   7  20 'pid  :'; PID=$REPLY;

	if [ "$PID" == "q" ] ; then 
		tput cnorm
		exit 0
		break;
	fi

	if ps -p $PID > /dev/null
		then
		printf '\e[8;'40';'120't'

		#exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar    --geometry="129x42"  --font="Noto Sans Mono  Regular 15" --default-working-directory=$rep   --title="LLDB : "$PROJECT -x  pkexec lldb --attach-pid $PID 
        exec gnome-terminal --hide-menubar   --geometry="129x42" --default-working-directory=$rep --title="LLDB : "$PROJECT  -- pkexec lldb --attach-pid $PID
		break
	else
		f_readPos 9 50  'erreur PID invalide'
	fi
done

tput cnorm
exit 0

