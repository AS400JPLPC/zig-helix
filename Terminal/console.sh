#!/bin/sh
# standard 1980/1080
#xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar    --geometry="158x42"  --font="DejaVu Sans Mono 12"
cd $1
# ecran 32" 3841x2610 
exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar  -T "CONSOLE"  --geometry="168x44"  --font="Noto Sans Mono  Regular 15"  
exit 0
