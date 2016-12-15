# Startx
alias xx=startx

# Light and dark solarized
alias lbg='xrdb -load $HOME/.config/xresources/lightsolarized'
alias dbg='xrdb -load $HOME/.config/xresources/darksolarized'

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
alias pupg='sudo pacman -Syu'
alias pins='sudo pacman -S'
alias editmirror='sudo nvim -d /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist'
alias newmirror='sudo mv /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist'

# rsync alias
alias rsync='noglob rsync'

# nvim alias
alias v=nvim

# chibi-scheme
alias cbs=chibi-scheme

# tmux alias
alias tmux='TERM=screen-256color-bce tmux'

# git aliases
alias g=git
alias gcm='git commit -a -m'
alias gch='git checkout'
alias gdiff='git diff --staged'
alias glog='git log --oneline --graph --decorate --all'
alias gst='git status'
alias gpu='git push origin HEAD'

# search aliases
alias sspy='sillysearch -x py'
alias ssex='sillysearch -x ex -x eex -x exs'
alias sshas='sillysearch -x hs'

# python aliases
alias pytest='python -m unittest tests/*.py'

# upgrade all pip packages
alias getpipupgrades='pip freeze --local | grep -v '^\-e' | cut -d = -f 1'
alias upgradepip='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U'

# Miscellaneous
alias bc='bc -l'
alias videoplayer='xset s off -dpms;mpv'
