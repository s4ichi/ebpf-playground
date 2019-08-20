#!/bin/bash
set -ex

test -f ~/bootstrapped && exit

sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install emacs26-nox tmux git zsh make zip

echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

cd ~

mkdir src && cd src
git clone https://github.com/s4ichi/d0tfiles.git && cd d0tfiles

./bin/install
./bin/doom-install

sudo chsh -s `which zsh` vagrant
date > ~/bootstrapped
