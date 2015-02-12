#!/bin/bash

echo -e "\e[44mDETECTINGS!!!\e[0m"
python -c 'import sys; print sys.real_prefix' 2>/dev/null && INVENV=1 || INVENV=0


echo -e "\e[44mINSTALLING ALL THE THINGS!!!\e[0m"
#debian only atm
sudo apt-get install -y vim tig tmux silversearcher-ag
sudo apt-get -y autoremove

if [ "$INENV" == "1" ]  
then
    pip install ptpython
else
    sudo pip install ptpython
fi

echo -e "\e[44mGETTING ALL THE GITTINGS!!!\e[0m"

if [ -e ~/.dotfiles ]; then
    cd ~/.dotfiles && git pull origin master
else
    git clone https://github.com/nicwest/slimfiles.git ~/.dotfiles
fi

echo -e "\e[44mLINKING THE FILES!!!\e[0m"
for dotfile in .aliases .tmux.conf .vimrc; do
    if [ -e ~/$dotfile ]; then
        echo -e "\e[91mDROPPING $dotfile\e[0m"
        rm ~/$dotfile
    fi
    echo -e "\e[94mLINKING $dotfile\e[0m"
    ln -s ~/.dotfiles/$dotfile ~/$dotfile
done

echo -e "\e[44mSETUP!!!\e[0m"
if [ -e ~/.bashrc ]
then
    echo -e "\e[94mBASH!\e[0m"
    if ! grep -qe "^source ~/.aliases$" ~/.bashrc; then
        echo 'source ~/.aliases' >> ~/.bashrc
    fi
    source ~/.bashrc
fi

if [ -e ~/.zshrc ]
then
    echo -e "\e[94mZSH!\e[0m"
    if ! grep -qe "^source ~/.aliases$" ~/.zshrc; then
        echo 'source ~/.aliases' >> ~/.zshrc
    fi
    source ~/.zshrc
fi



