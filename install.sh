#!/bin/bash

DOTPATH=~/.dotfiles

cd ~/.dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

deploy() {
  for f in .??*
  do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
  done
}

initialize() {
  # base
  sudo apt-get install -y git zsh vim tmux ctags curl
  sudo apt-get install -y make binutils bison gcc build-essential

  # vim dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
  sh ~/installer.sh ~/.cache/dein
  rm ~/installer.sh
}

if [ "$1" = "deploy" -o "$1" = "d" ]; then
  echo "deploy"
  deploy
elif [ "$1" = "init" -o "$1" = "i" ]; then
  echo "initialize"
  initialize
fi
