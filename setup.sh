#!/bin/bash
# Make sure that curl and ruby are installed first

# Copy .vimrc to home directory
cp vim/.vimrc ~/.vimrc

# Copy .Xresources to home directory
cp xresources/.Xresources ~/.Xresources

# Copy light and dark solarized themes to xresources config directory
[[ -d ~/.config/xresources ]] || mkdir -p ~/.config/xresources
rm -rf ~/.config/xresources/*
cp xresources/lightsolarized xresources/darksolarized ~/.config/xresources

# Copy .zshrc to home directory
cp zsh/.zshrc ~/.zshrc

# Copy zsh config files to zsh config directory
[[ -d ~/.config/zsh ]] || mkdir -p ~/.config/zsh
rm -rf ~/.config/zsh/*
cp -r zsh/lib zsh/plugins ~/.config/zsh

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
git clone https://github.com/mkitt/tabline.vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/mustache/vim-mustache-handlebars.git
git clone https://github.com/elixir-lang/vim-elixir.git
git clone https://github.com/zah/nimrod.vim.git
