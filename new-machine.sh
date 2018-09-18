#!/bin/bash
###################################
# new-machine.sh
# Quick and dirty script to populate my stuff on a new Ubuntu/Debian machine
###################################
syncpath=${1:-eeemil@eeemil.com:~/sync}

echo "Downloading dotfiles and ssh synckey"
rsync -Lr --progress $syncpath $HOME/

echo "Adding synckey to ssh-agent"
cd $HOME
mkdir .ssh
chmod 700 .ssh
ln -s $HOME/sync/.ssh/id_rsa_synckey .ssh/
ln -s $HOME/sync/.ssh/id_rsa_synckey.pub .ssh/
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_rsa_synckey

echo "Adding synckey to authorized keys"
cat $HOME/.ssh/id_rsa_synckey.pub >> $HOME/.ssh/authorized_keys 

echo "Adding and deploying dotfiles"
ln -s $HOME/sync/dotfiles dotfiles
$HOME/dotfiles/deploy.sh

echo "Installing git and zsh"
# Install git and zsh
sudo apt update
sudo apt install -y git zsh
# Install emacs without graphical support
echo "Installing emacs without graphical support"
sudo apt install -y emacs2.-nox

echo "Upgrading packages"
sudo apt upgrade -y

echo "Changing shell to zsh"
if [ $(which zsh) ]; then
    sudo usermod -s $(which zsh) $(whoami)
fi
