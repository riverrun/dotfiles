# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi

# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -A'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

# rsync alias
alias rsync='noglob rsync'

# Vim aliases
alias v=vim
alias vd=vimdiff

# git repositories
alias g1='cd /data/develop/python/genxword/'
alias g2='cd /data/develop/python/cheesemaker/'
alias g3='cd /data/develop/python/drat/'
alias g4='cd /data/develop/python/aiourlstatus/'
alias g5='cd /data/develop/python/web/uni-website/'
alias ge1='cd /data/develop/elixir/comeonin/'
alias ge2='cd /data/develop/elixir/sanction/'

# python tests
alias pytest='python -m unittest tests/*.py'

# upgrade all pip packages
alias upgradepip='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U'

# Miscellaneous
alias bc='bc -l'
