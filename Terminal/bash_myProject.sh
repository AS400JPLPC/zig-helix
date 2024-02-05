#!/bin/sh


exec xfce4-terminal --hide-menubar --hide-scrollbar --hide-toolbar    --geometry="129x42"  --font="Noto Sans Mono  Regular 15"   --default-working-directory=$1  --title="PROJECT : "$2 -x helix

exit 0
