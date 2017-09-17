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

# opensuse aliases
alias zup='sudo zypper update'
alias zdup='sudo zypper dup --no-allow-vendor-change'

# rsync alias
alias rsync='noglob rsync'

# nvim alias
alias v=nvim

# git aliases
alias g=git
alias gcm='git commit -a -m'
alias gch='git checkout'
alias gdiff='git diff --staged'
alias glog='git log --oneline --graph --decorate --all'
alias gst='git status'
alias gpu='git push origin HEAD'

# python aliases
alias pytest='python -m unittest tests/*.py'
