# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Basic directory operations
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias cdd='cd $HOME/develop'
alias cdscripts='cd $HOME/develop/scripts'
alias cdwork='cd $HOME/develop/work'
alias cdpy='cd $HOME/develop/python'
alias cdex='cd $HOME/develop/elixir'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

function cdnew() {
    mkdir -p $1
    cd $1
}
