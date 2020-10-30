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

# Solarized dir colors
eval `dircolors ~/.dircolors`

# Load the theme
source "$ZSH/$ZSH_THEME.zsh-theme"

# Enable Elixir shell history
export ERL_AFLAGS="-kernel shell_history enabled"
