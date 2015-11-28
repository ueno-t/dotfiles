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
sudo apt-get install -y make binutils bison gcc build-essential

# vim neobundle
mkdir -p ~/.vim/bundle
git submodule git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git submodule init
git submodule update

# docker-engine
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572c52609d
echo 'deb https://apt.dockerproject.org/repo debian-jessie main' |sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install -y docker-engine

# haskell stack
echo 'deb http://download.fpcomplete.com/debian/jessie stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/debian/fpco.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y stack

# node nodebrew
curl -L git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew install-binary stable
nodebrew use stable

# golang gobrew
curl -L https://raw.github.com/grobins2/gobrew/master/tools/install.sh | sh
export PATH=$HOME/.gobrew/bin:$PATH
eval "$(gobrew init -)"
gobrew install 1.5.1
gobrew use 1.5.1

