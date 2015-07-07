#!/bin/bash
# Make sure that curl and ruby are installed first

# Copy .vimrc to home directory
cp vim/.vimrc ~/.vimrc

# Copy .zshrc to home directory
cp zsh/.zshrc ~/.zshrc

# Copy .tmux.conf to home directory
cp tmux/.tmux.conf ~/.tmux.conf

# Copy zsh config files to zsh config directory
[[ -d ~/.config/zsh ]] || mkdir -p ~/.config/zsh
rm -rf ~/.config/zsh/*
cp zsh/*.zsh zsh/*.zsh-theme ~/.config/zsh

# Set up pathogen
[[ -d ~/.vim ]] || mkdir ~/.vim
[[ -d ~/.vim/autoload ]] || mkdir ~/.vim/autoload
rm -rf ~/.vim/autoload/*
cd ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install plugins
[[ -d ~/.vim/bundle ]] || mkdir ~/.vim/bundle
rm -rf ~/.vim/bundle/*
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/elixir-lang/vim-elixir.git
