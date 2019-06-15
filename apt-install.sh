#!/bin/bash
sudo apt update
# Base utilities
sudo apt install -y emacs terminator chromium-browser chrome-gnome-shell thunderbird curl gnome-tweak-tool
# Dev packages
sudo apt install -y git build-essential zsh
# Python
sudo apt install -y python3 python3-pip virtualenv

sudo -H pip3 install --upgrade pip
pip3 install Pygments
