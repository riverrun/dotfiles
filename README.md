# dotfiles

Files for setting up zsh, neovim, etc.

## gitconfig notes

```
git config --global user.name "David Whitlock"
git config --global user.email "alovedalongthe@gmail.com"
git config --global core.editor "nvim"
gpg --list-secret-keys --keyid-format=long # to get the fingerprint - after setting up the gpg key
git config --global user.signingkey ABCDEF01 # where ABCDEF01 is the fingerprint of the key to use
git config --global commit.gpgsign true
git config --global diff.tool nvimdiff
git config --global merge.tool nvimdiff
git config --global mergetool.keepBackup false
```

## gnome notes

Stop the cursor from blinking in gnome terminal

```
gsettings set org.gnome.desktop.interface cursor-blink false
```
