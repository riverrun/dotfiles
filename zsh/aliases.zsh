# Startx
alias xx=startx

# Light and dark solarized
alias lbg='xrdb -merge $HOME/.config/xresources/lightsolarized'
alias dbg='xrdb -merge $HOME/.config/xresources/darksolarized'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Super user
alias _='sudo'

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
alias ls='ls --color=auto'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -A'
alias sl=ls # often screw this up

# archlinux aliases
alias pupgr='sudo pacman -Syu'
alias pinst='sudo pacman -S'

# rsync alias
alias rsync='noglob rsync'

# Vim aliases
alias v=nvim

# git aliases
alias g=git
alias gcom='git commit -a -m'
alias gcb='git checkout -b'
alias gpu='git push origin HEAD'

# python tests
alias pytest='python -m unittest tests/*.py'

# upgrade all pip packages
alias upgradepip='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U'

# Miscellaneous
alias bc='bc -l'
