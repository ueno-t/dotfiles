#!/bin/bash
set -e
DOTPATH=~/.dotfiles
TARBALL="https://github.com/ueno-t/.dotfiles/tarball/master"

usage () {
  name=`basename $0`
  cat <<EOF
Usage:
  $name [command]
Commands:
  deploy
  init
EOF
  exit 1
}

download() {
  mkdir $DOTPATH
  curl -fsSLo $HOME/dotfiles.tar.gz $TARBALL
  tar -zxf $HOME/dotfiles.tar.gz --strip-components 1 -C $DOTPATH
  rm $HOME/dotfiles.tar.gz
}

deploy() {
  cd $DOTPATH
  if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
  fi

  for f in .??*
  do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
  done
}

initialize() {
  # base
  sudo apt-get install -y git zsh vim tmux ctags curl
  sudo apt-get install -y make binutils bison gcc build-essential

  # vim dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/deinstaller.sh
  sh ~/deinstaller.sh ~/.cache/dein
  rm ~/deinstaller.sh
}

command=$1
[ $# -gt 0 ] && shift

case $command in
  download)
    download
    ;;
  deploy)
    deploy
    ;;
  init)
    initialize
    ;;
  *)
    usage
    ;;
esac

exit 0
