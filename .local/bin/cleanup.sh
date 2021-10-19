#!/bin/bash

echo '##### Cleaning cache... #####'
rm -rf ~/.cache/* ~/.cache/.*
rm -rf ~/.config/.cache
rm -rf ~/.config/chromium/*/Service\ Worker
rm -rf ~/.config/VSCodium/*Cache*
rm -rf ~/.config/VSCodium/logs
rm -rf ~/.config/VSCodium/Service\ Worker
rm -rf ~/.config/Signal/*Cache*
rm -rf ~/.config/Signal/logs
rm -rf ~/.config/Signal/temp
rm -rf ~/.gnome
rm -rf ~/.local/share/gvfs-metadata
rm -rf ~/.local/share/RecentDocuments
rm -rf ~/.local/share/virtualenv
rm -rf ~/.npm   
rm -rf ~/.oh-my-zsh/cache/*
rm -rf ~/.pylint.d
rm -f ~/.local/share/recently-used.xbel
rm -f ~/.lesshst
rm -f ~/.viminfo
rm -f ~/.*_history

echo -e '\n##### Cleaning system packages... #####'
pacman -Qdtq | sudo pacman -Rs -
yes | sudo pacman -Scc
exit 0 
