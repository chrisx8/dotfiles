#!/bin/bash

echo '##### Cleaning cache... #####'
rm -rf ~/.cache/*
rm -rf ~/.gnome
rm -rf ~/.local/share/virtualenv
rm -rf ~/.npm   
rm -rf ~/.pylint.d
rm -f ~/.local/share/recently-used.xbel
rm -f ~/.lesshst
rm -f ~/.viminfo
rm -f ~/.*_history

echo -e '\n##### Cleaning system packages... #####'
pacman -Qdtq | sudo pacman -Rs -
yes | sudo pacman -Scc
exit 0 
