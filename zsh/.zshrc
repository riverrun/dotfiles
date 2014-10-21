# Path to zsh config
export ZSH=$HOME/.config/zsh

# Set name of the theme to load.
ZSH_THEME="newnano"

# Plugins to load.
plugins=(git)

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

for config_file ($ZSH/lib/*.zsh); do
  source $config_file
done

fpath=($ZSH/plugins/$plugin $fpath)

# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# Solarized dir colors
eval `dircolors ~/.dircolors`

# Load the theme
source "$ZSH/plugins/$ZSH_THEME.zsh-theme"

PATH=$PATH:${HOME}/bin/elixir/bin
