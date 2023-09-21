#!/bin/bash
faStabilo='\033[7m'
fcRouge='\033[31m'
fcJaune='\033[33;1m'
fcCyan='\033[36m'
fcGreen='\033[32m'
fcBleu='\033[34m'
fcNoir='\033[0;0m'

faGras='\033[1m'

# parm this lanceur 
# Exec=$HOME/.Terminal/Zterm.sh $HOME/Zterm/ GenCurs






projet_lib=$1

name_src=$2".zig"

projet_src="src-zig/"

# type Compile
mode=""

# name binary
projet_bin=$projet_lib${name_src%.*}

# folder cache
folder_cache_src=$projet_lib$projet_src"zig-cache"

folder_cache_deps=$projet_lib$projet_src"deps/zig-cache"

folder_cache_home=$HOME"/.cache/zig"

# folder out
folder_out=$projet_lib$projet_src"zig-out"
# folder out bin
folder_bin=$projet_lib$projet_src"zig-out/bin/"${name_src%.*}



choix=""

#=========================
# Func clear projet interne
#=========================
f_clear_Compile() { 

			if test -f $projet_bin  ; then
				rm -r $projet_bin 
			fi

			if test -d $folder_cache_src ; then
				rm -r $folder_cache_src
			fi

			if test -d $folder_out ; then
				rm -r $folder_out
			fi

			if test -d $folder_cache_home ; then
				rm -r $folder_cache_home
			fi
} 


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

f_dsplyPos(){ #commande de positionnement	lines + coln + couleur + text
	echo -en '\033[0;0m'
	let lig=$1
	let col=$2
	echo -en '\033['$lig';'$col'f'$3$4

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

# resize 
printf '\e[8;'25';'80't'



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
while [ "$choix" != "99" ]
do
	cd 
	f_cls
	f_dsplyPos  1  24 $faGras$fcJaune 'Langage->'$name_src

	f_dsplyPos  3  24 $faGras$fcJaune '------------Editor---------------------'
	f_dsplyPos  4  20 $faGras$fcRouge' 1.'; f_dsplyPos  4  24 $faGras$fcGreen 'Terminal-helix'

	f_dsplyPos  6  24 $faGras$fcJaune '------------compile cpp-----------------'
	f_dsplyPos  7  20 $faGras$fcRouge' 2.'; f_dsplyPos  7  24 $faGras$fcGreen 'Terminal-Gen'

	f_dsplyPos  9  24 $faGras$fcJaune '------------compile Zig-----------------'
	f_dsplyPos 10  20 $faGras$fcRouge'12.'; f_dsplyPos 10  24 $faGras$fcGreen 'Gencurs'



	f_dsplyPos 16  24 $faGras$fcJaune '----------------------------------------'
	f_dsplyPos 17  20 $faGras$fcRouge'88.'; f_dsplyPos 17  24 $faGras$fcGreen 'Console'

	f_dsplyPos 20  20 $faGras$fcRouge'99.'; f_dsplyPos 20 24 $faGras$fcJaune  'Quit'

	f_dsplyPos 23  24 $faGras$fcBleu '----------------------------------------'
	f_readPos  24 20  'Votre choix  :'; choix=$REPLY;
	
	# Recherche de caractères non numériques dans les arguments.
	if echo $choix | tr -d [:blank:] | tr -d [:digit:] | grep . &> /dev/null; then
		f_readPos 24 90  'erreur de saisie Enter'
	else
		 
 		case "$choix" in

# Helix
        1)
            echo -e  "Terminal-helix"

			/home/soleil/.Terminal/EnvCPP.sh  "/home/soleil/Zterm/"   "helix"

		;;

# Gen
        2)
            echo -e  "Terminal-Gen"

			/home/soleil/.Terminal/EnvCPP.sh  "/home/soleil/Zterm/"   "Gen"			

            ;;
#Gencurs
        12)
            echo -e  "Gencurs"

			/home/soleil/.Terminal/EnvZig.sh  "/home/soleil/Zterm/"   "Gencurs"			

            ;;


#console

		88)

			exec /home/soleil/.Terminal/console.sh 

			 break
            ;;
# QUIT
        99)
            break
            ;;

	esac 
	fi # fintest option
done

tput cnorm
exit 0
