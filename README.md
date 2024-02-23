# dotfiles

Files for setting up zsh, neovim, etc.

## initial setup

create symlinks to nvim and zsh config (overwriting existing config)

```
rm -rf ~/.config/nvim
ln -s ~/develop/dotfiles/nvim ~/.config/nvim
rm -rf ~/.config/zsh
ln -s ~/develop/dotfiles/zsh ~/.config/zsh
rm ~/.zshrc
ln -s ~/develop/dotfiles/.zshrc ~/.zshrc
rm ~/.psqlrc
ln -s ~/develop/dotfiles/.psqlrc ~/.psqlrc
```

## neovim

requires lua-language-server and gopls (install with brew or other package manager)

python3 -m pip install --upgrade pip
pip3 install pynvim
npm install -g neovim
npm install -g pyright
npm install -g bash-language-server
brew install marksman

for tree-sitter, need to install language parsers

```
TSInstall bash c elixir go help lua markdown python vim
```

### Elixir

run the following commands (if elixir-ls has already been cloned, run `git fetch origin` after cd-ing into .elixir-ls):

```
git clone git@github.com:elixir-lsp/elixir-ls.git ~/.elixir-ls
cd ~/.elixir-ls
git checkout v0.14.6 # checkout the latest release
mix deps.get
MIX_ENV=prod mix compile
MIX_ENV=prod mix elixir_ls.release
```
