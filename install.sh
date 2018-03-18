#!/bin/bash

DOTPATH=~/.dotfiles

cd ~/.dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

# base
sudo apt-get install -y git zsh vim tmux ctags curl
# sudo apt-get install -y make binutils bison gcc build-essential

# vim dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/install.sh ~/.cache/dein
rm ~/install.sh
