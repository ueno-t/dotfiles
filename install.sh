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

# vim neobundle
mkdir -p ~/.vim/bundle
git submodule git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git submodule init
git submodule update

