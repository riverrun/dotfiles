# Path to zsh config
export ZSH=$HOME/.config/zsh

# Set name of the theme to load.
ZSH_THEME="newnano"

for config_file ($ZSH/*.zsh); do
  source $config_file
done

# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# Solarized dir colors
eval `dircolors ~/.dircolors`

# Load the theme
source "$ZSH/$ZSH_THEME.zsh-theme"

PATH=$PATH:${HOME}/bin/elixir/bin:${HOME}/.gem/ruby/2.1.0/bin
