#!/bin/sh
# $1 directory
# $2 project

set -x
nohup  $HOME/.Terminal/TermHX  $2 $1 &exit
set +x
exit 0
