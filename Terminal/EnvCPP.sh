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
# Exec=$HOME/.Terminal/Zterm.sh $HOME/EnvCPP Gen




projet_lib=$1

name_src=$2".cpp"

# type Compile
mode=""

# name binary
projet_bin=${name_src%.*}

# lib obj
folder_obj=$projet_lib"obj"



cd $projet_lib



choix=""



#=========================
# Func ok Compile 
#=========================
f_read_RESUTAT() {	#RESULTAT

	echo -en $faStabilo$fcCyan"BUILD "$mode $fcNoir "  " $fcJaune$name_src $fcNoir "->" $fcCyan $projet_bin $fcNoir
	echo -en "  size : "
	ls -lrtsh $projet_lib$projet_bin | cut -d " " -f6




	if test -d $folder_obj ; then
    	rm -r $folder_obj
	fi
	
	echo -en '\033[0;0m';
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
printf '\e[8;'24';'120't'


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
while [ "$choix" != "99" ]
do
	cd 
	f_cls
	f_dsplyPos 1  24 $faGras$fcJaune 'COMPILE CPP ->'$name_src
	f_dsplyPos 2  24 $faGras$fcJaune '----------------------------------------'
	f_dsplyPos 3  20 $faGras$fcRouge' 1.'; f_dsplyPos 3  24 $faGras$fcGreen 'ClearProjet'
	f_dsplyPos 5  20 $faGras$fcRouge' 2.'; f_dsplyPos 5  24 $faGras$fcGreen 'Compile_Debug'
	f_dsplyPos 7  20 $faGras$fcRouge' 3.'; f_dsplyPos 7  24 $faGras$fcGreen 'Compile_Prod'

	f_dsplyPos 10 20 $faGras$fcRouge'99.'; f_dsplyPos 10 24 $faGras$fcJaune 'Quit'

	f_dsplyPos 11 24 $faGras$fcBleu '----------------------------------------'
	f_readPos  12 20  'Votre choix  :'; choix=$REPLY;
	
	# Recherche de caractères non numériques dans les arguments.
	if echo $choix | tr -d [:blank:] | tr -d [:digit:] | grep . &> /dev/null; then
		f_readPos 12 90  'erreur de saisie Enter'
	else
		 
 		case "$choix" in

# Clear projet Cache and binary
        1)
            echo -e  "Clear Projet_CPP"

			if test -f $projet_bin  ; then
				rm -r $projet_bin 
			fi
			
			if test -d $folder_obj ; then
    			rm -r $folder_obj
			fi

			;;

# DEBUG
        2)
			f_cls
            echo -e $faStabilo$fcGreen"Compile_Debug_CPP"$fcNoir

			if [ ! -d $projet_lib$folder_obj ] ; then
    			mkdir  $folder_obj
    		fi
			
			( set -x ; \

					 make -C $projet_lib -f ./Makefile PROD=true clean all PGM=$projet_bin  \
			)

			if test -f $projet_lib$projet_bin; then
				mode="DEBUG"
				f_read_RESUTAT
			fi

			f_pause
            ;;

# PROD
        3)
			f_cls
            echo -e $faStabilo$fcGreen"Compile_Prod_CPP"$fcNoir
			
			if [ ! -d $projet_lib$folder_obj ] ; then
    			mkdir  $folder_obj
    		fi
			
			( set -x ; \
					make -C $projet_lib -f ./Makefile PROD=true clean all PGM=$projet_bin ; \
			)

			if test -f $projet_lib$projet_bin; then

				mode="PROD"
				f_read_RESUTAT
			fi

			f_pause
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
