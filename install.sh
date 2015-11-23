#!/bin/bash

DOTPATH=~/.dotfiles

# git
if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# or curl, wget
elif has "curl" || has "wget"; then
    tarball="https://github.com/b4b4r07/dotfiles/archive/master.tar.gz"
    
    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar xv -
    
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

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

# docker-engine
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572c52609d
echo 'deb https://apt.dockerproject.org/repo debian-jessie main' |sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get install apt-transport-https
apt-cache policy docker-engine
sudo apt-get install -y docker-engine

# node nodebrew
curl -L git.io/nodebrew | perl - setup
nodebrew install-binary stable
nodebrew use stable

# haskell stack
echo 'deb http://download.fpcomplete.com/debian/jessie stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/debian/fpco.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y stack

# golang goberw
curl -L https://raw.github.com/grobins2/gobrew/master/tools/install.sh | sh
gobrew install 1.5.1
gobrew use 1.5.1

