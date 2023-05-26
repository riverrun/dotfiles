# Setup

## neovim setup

copy dotfiles nvim directory to ~/.config # need to have ssh setup

brew install lua-language-server # add notes for Linux later
python3 -m pip install --upgrade pip
pip3 install pynvim
npm install -g neovim
npm install -g pyright
npm install -g bash-language-server
brew install gopls
git clone git@github.com:elixir-lsp/elixir-ls.git ~/.elixir-ls

to setup elixir-ls (if already cloned, run `git fetch origin` after cd-ing into .elixir-ls):

```
git clone git@github.com:elixir-lsp/elixir-ls.git ~/.elixir-ls
cd ~/.elixir-ls
git checkout v0.14.6 # checkout the latest release
mix deps.get
MIX_ENV=prod mix compile
MIX_ENV=prod mix elixir_ls.release
```

for tree-sitter, need to install language parsers

:TSInstall <language_to_install>

also see :TSInstallInfo

bash, c, elixir, go, lua, markdown, python, vim

