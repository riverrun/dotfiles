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

# use eza instead of ls
alias ls='eza'
alias la='eza -a'
alias lr='eza -R'
alias ltree='eza -T'

# git aliases
alias g='noglob git'
alias git='noglob git'
alias gpu='git push origin HEAD'

# misc aliases
alias rg='noglob rg'
alias rsync='noglob rsync'
alias v=nvim
alias jwt="jq -R 'split(\".\") | .[1] | @base64d | fromjson' <<< $1"
