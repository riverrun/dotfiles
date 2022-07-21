# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# startx
alias xx='startx'

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
alias unrequired='comm -23 <(pacman -Qqt | sort) <(pacman -Sqg base base-devel | sort)'

# git aliases
alias g=git
alias gbr='git branch'
alias gcm='git commit -a -m'
alias gch='git checkout'
alias gdiff='git diff --staged'
alias glog='git log --oneline --graph --decorate'
alias gloga='git log --oneline --graph --decorate --all'
alias gst='git status'
alias gpu='git push origin HEAD'

# misc aliases
alias multi='xrandr --output VGA1 --auto --left-of LVDS1'
alias rsync='noglob rsync'
alias v=nvim
alias tmux='tmux -2'
