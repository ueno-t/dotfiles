#!/bin/bash
set -e
DOTPATH=~/.dotfiles
TARBALL="https://github.com/ueno-t/.dotfiles/archive/master.tar.gz"

has() {
  type "$1" > /dev/null 2>&1
}

usage () {
  name=`basename $0`
  cat <<EOF
Usage:
  $name [command]
Commands:
  all
  download
  deploy
  init
EOF
  exit 1
}

all() {
  download
  deploy
  initialize
}

download() {
  if has "curl"; then
    curl -L $TARBALL
  elif has "wget"; then
    wget -O - $TARBALL
  fi | tar xzv
  mv -f .dotfiles-master $DOTPATH
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
}

command=$1
[ $# -gt 0 ] && shift

case $command in
  all)
    all
    ;;
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
