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
#alias ls='ls --color=auto'
#alias la='ls -A'
#alias lr='ls -R'

# use exa instead of ls
alias ls='exa'
alias la='exa -a'
alias lr='exa -R'
alias ltree='exa -T'

# archlinux aliases
alias pupg='sudo pacman -Syu'
alias pins='sudo pacman -S'
alias editmirror='sudo nvim -d /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist'
alias newmirror='sudo mv /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist'

# git aliases
alias g='noglob git'
alias git='noglob git'
alias gbr='git branch'
alias gcm='git commit -a -m'
alias gch='git checkout'
alias gst='git status'
alias gpu='git push origin HEAD'
alias glog='git log --oneline'

# misc aliases
alias rg='noglob rg'
alias rsync='noglob rsync'
alias v=nvim
