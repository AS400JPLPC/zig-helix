#!/bin/bash
#set +x 


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


folder_library=$projet_lib"library"

folder_cache_zig=$HOME"/.cache/zig"
folder_cache_zls=$HOME"/.cache/zls"
# folder src
folder_src=$projet_lib$projet_src

# folder out bin
folder_bin=$projet_lib$projet_src"zig-out/bin/"${name_src%.*}


folder_docs=$projet_lib$projet_src"zig-out/Docs_"${name_src%.*}

projet_docs=$projet_lib"Docs_"${name_src%.*}

choix=""

echo -en "$folder_docs\n"
echo -en "$projet_docs\n"
#=========================
# Func clear cache
#=========================
f_clear_Cache() {

if test -d "$projet_lib" ; then
        find $projet_lib -type d -name .zig-cache | while read line; do
        rm -r "$line"
    done
fi

if test -d "$folder_src" ; then
        find $folder_src -type d -name  zig-out | while read line; do
        rm -r "$line"
    done
fi
} 

#=========================
# Func clear projet interne
#=========================
f_clear_Compile() { 

    if test -f "$projet_bin"  ; then
        rm -f $projet_bin 
    fi
    f_clear_Cache
}
#=========================
# Func ok Compile 
#=========================
f_read_RESUTAT() {    #RESULTAT

    echo -en $faStabilo$fcCyan"BUILD "$mode $fcNoir "  " $fcJaune$name_src $fcNoir "->" $fcCyan $projet_bin $fcNoir
    echo -en "  size : "
    ls -lrtsh $folder_bin | cut -d " " -f6


    mv  $folder_bin $projet_bin

    f_clear_Cache
    
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
    tput civis     # curseur invisible
    read -s -n 1
    echo -en '\033[0;0m'
}

f_dsplyPos(){ #commande de positionnement    lines + coln + couleur + text
    echo -en '\033[0;0m'
    let lig=$1
    let col=$2
    echo -en '\033['$lig';'$col'f'$3$4

}
f_readPos() {    #commande de positionnement    lines + coln + text 
    echo -en '\033[0;0m'
    let lig=$1
    let col=$2
    let colR=$2+${#3}+1  # si on doit coller faire  $2+${#3}
    echo -en '\033['$lig';'$col'f'$fdVert$faGras$fcBlanc$3 
    echo -en '\033[0;0m' 
    tput cnorm    # curseur visible
     echo -en '\033['$lig';'$colR'f'$faGras$fcGreen
    read   
    tput civis     # curseur invisible
    echo -en '\033[0;0m'
}

# resize 
printf '\e[8;'24';'120't'

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
while [ "$choix" != "99" ]
do
 
    f_cls
    f_dsplyPos 1  24 $faGras$fcJaune 'COMPILE ->'$name_src
    f_dsplyPos 2  24 $faGras$fcJaune '----------------------------------------'
    f_dsplyPos  4  20 $faGras$fcRouge' 1.'; f_dsplyPos  4  24 $faGras$fcGreen 'Clear_Projet'
    f_dsplyPos  6  20 $faGras$fcRouge' 2.'; f_dsplyPos     6  24 $faGras$fcGreen 'Compile_Debug'
    f_dsplyPos  8  20 $faGras$fcRouge' 3.'; f_dsplyPos     8  24 $faGras$fcGreen 'Compile_Prod'
    f_dsplyPos 10  20 $faGras$fcRouge' 4.'; f_dsplyPos 10  24 $faGras$fcGreen 'Compile_Safe'
    f_dsplyPos 12  20 $faGras$fcRouge' 5.'; f_dsplyPos 12  24 $faGras$fcGreen 'Compile_Small'
    f_dsplyPos 14  20 $faGras$fcRouge' 6.'; f_dsplyPos 14  24 $faGras$fcGreen 'Compile_test'
    f_dsplyPos 16  20 $faGras$fcRouge' 7.'; f_dsplyPos 16  24 $faGras$fcGreen 'Compile_Doc'
    f_dsplyPos 18  20 $faGras$fcRouge'99.'; f_dsplyPos 18  24 $faGras$fcJaune 'Quit'

    f_dsplyPos 20 24 $faGras$fcBleu '----------------------------------------'
    f_readPos  22 20  'Votre choix  :'; choix=$REPLY;

    # Recherche de caractères non numériques dans les arguments.
    if echo $choix | tr -d [:blank:] | tr -d [:digit:] | grep . &> /dev/null; then
        f_readPos 22 90  'erreur de saisie Enter'
    else
         case "$choix" in

# Clear projet Cache
        1)
            echo -e  "Clear Projet"
            f_clear_Cache
            if test -d "$folder_cache_zig" ; then
                rm -r $folder_cache_zig
            fi
        
            if test -d "$folder_cache_zls" ; then
                rm -r $folder_cache_zls
            fi    
            ;;

# DEBUG
        2)
            f_cls
            echo -e $faStabilo$fcGreen"Compile_Debug"$fcNoir
            
            f_clear_Compile
            
            ( set -x ; \
                ~/.zig/zig build -Doptimize=Debug --build-file $projet_lib$projet_src"build"$name_src;\
            )

            if test -f "$folder_bin" ; then
                mode="DEBUG"
                f_read_RESUTAT
            else
                if_clear_Cache
            fi
            
            f_pause
        ;;

# PROD
        3)
            f_cls
            echo -e $faStabilo$fcGreen"Compile_Prod"$fcNoir
            
            f_clear_Compile
            
            ( set -x ; \
                ~/.zig/zig build -Doptimize=ReleaseFast --build-file $projet_lib$projet_src"build"$name_src ;\
            )
            
            if test -f "$folder_bin" ; then
                mode="PROD"
                f_read_RESUTAT
            else
                f_clear_Cache
            fi

            f_pause
        ;;

# SAFE
        4)
            f_cls
            echo -e $faStabilo$fcGreen"Compile_Safe"$fcNoir
            
            f_clear_Compile
            
            ( set -x ; \
                ~/.zig/zig build -Doptimize=ReleaseSafe --build-file $projet_lib$projet_src"build"$name_src ;\
            )
            
            if test -f "$folder_bin" ; then
                mode="SAFE"
                f_read_RESUTAT
            else
                f_clear_Cache
            fi

            f_pause
        ;;

# SMALL
        5)
            f_cls
            echo -e $faStabilo$fcGreen"Compile_Small"$fcNoir
            
            f_clear_Compile
            
            ( set -x ; \
                ~/.zig/zig build -Doptimize=ReleaseSmall --build-file $projet_lib$projet_src"build"$name_src ;\
            )
            

            if test -f "$folder_bin" ; then
                mode="SMALL"
                f_read_RESUTAT
            else
                f_clear_Cache
            fi

            f_pause
        ;;

# TEST
        6)
            f_cls
            echo -e $faStabilo$fcGreen"Compile_Test"$fcNoir
            
            f_clear_Compile
            
            (set -x ; \
                ~/.zig/zig  build test -fsummary  --build-file $projet_lib$projet_src"build"$name_src ;\
                  f_clear_Compile;\
            )

            f_pause
        ;;


# DOC
        7)
            f_cls
            echo -e $faStabilo$fcGreen"Compile_Doc"$fcNoir
            
            f_clear_Compile

            if test -d "$folder_docs" ; then
            rm -r $folder_docs  
            fi
            
            ( set -x ; \
                ~/.zig/zig build docs --build-file $projet_lib$projet_src"build"$name_src ;\
            )
            echo -en "$folder_docs\n"
            if test -d "$folder_docs" ; then

                if test -d "$projet_docs" ; then
                    rm -r $projet_docs
                fi

                mv $folder_docs  $projet_docs

                echo -e $faStabilo$fcCyan"BUILD DOCS"$mode $fcNoir "  " $fcJaune$name_src $fcNoir "->" $fcCyan "Docs_"${name_src%.*} $fcNoir

                f_clear_Cache

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

