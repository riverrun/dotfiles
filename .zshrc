# Path to zsh config
export ZSH=$HOME/.config/zsh

# Set name of the theme to load.
ZSH_THEME="custom"

for config_file ($ZSH/*.zsh); do
    source $config_file
done
setopt extended_glob

# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# Load the theme
source "$ZSH/$ZSH_THEME.zsh-theme"

# Enable Elixir shell history
export ERL_AFLAGS="-kernel shell_history enabled"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# with fzf, use fd instead of find
export FZF_DEFAULT_COMMAND='fd --type file --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export GPG_TTY=$(tty)
    eval "$(/opt/homebrew/bin/brew shellenv)"
    . /opt/homebrew/opt/asdf/libexec/asdf.sh

    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

    PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/curl/bin:$PATH"
    PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/openssh/bin:$PATH"
    PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"
    PATH="$HOME/go/bin:$PATH"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    . /usr/share/fzf/key-bindings.zsh
    . /usr/share/fzf/completion.zsh
fi
