#!/bin/bash

echo -e "\e[44mINSTALLING ALL THE THINGS!!!\e[0m"
#debian only atm
sudo apt-get install vim-gtk tig tmux silversearcher-ag
sudo pip install ptpython

echo -e "\e[44mGETTING ALL THE GITTINGS!!!\e[0m"
git clone https://github.com/nicwest/slimfiles.git ~/.dotfiles

echo -e "\e[44mLINKING THE FILES!!!\e[0m"
for dotfile in .aliases .tigrc .tmux.conf .vimrc; do
    echo -e "\e[94mLINKING $dotfile\e[0m"
    ln -s ~/.dotfiles/$dotfile ~/$dotfile
done
