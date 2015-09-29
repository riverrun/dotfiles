#!/bin/bash
# Make sure that curl and ruby are installed first

# Copy .vimrc to home directory
cp vim/.vimrc ~/.vimrc

# Copy .zshrc to home directory
cp zsh/.zshrc ~/.zshrc

# Copy zsh config files to zsh config directory
[[ -d ~/.config/zsh ]] || mkdir -p ~/.config/zsh
rm -rf ~/.config/zsh/*
cp zsh/*.zsh zsh/*.zsh-theme ~/.config/zsh

# Set up vim-plug
[[ -d ~/.vim ]] || mkdir ~/.vim
[[ -d ~/.vim/autoload ]] || mkdir ~/.vim/autoload
rm -rf ~/.vim/autoload/*
cd ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
