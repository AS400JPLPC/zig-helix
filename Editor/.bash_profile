#
# ~/.bash_profile
#

export PATH=$HOME/.zls:$PATH
export PATH=$HOME/.zig:$PATH

export PATH=$PATH:$HOME/.helix/

export HELIX_RUNTIME=$HOME/.helix/runtime/

[[ -f ~/.bashrc ]] && . ~/.bashrc
