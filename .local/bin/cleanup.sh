#!/bin/bash

echo '##### Cleaning cache... #####'
rm -rf ~/.cache
rm -rf ".config/Code - OSS/Cache"
rm -rf ".config/Code - OSS/CachedData"
rm -rf ".config/Code - OSS/CachedExtensions"
rm -rf ".config/Code - OSS/CachedExtensionVSIXs"
rm -rf ".config/Code - OSS/Code Cache"
rm -rf ".config/Code - OSS/GPUCache"
rm -rf ".config/Signal/Cache"
rm -rf ".config/Signal/Code Cache"
rm -rf ".config/Signal/GPUCache"
rm -rf ".config/Signal/temp"
rm -rf ~/.gnome
rm -rf .local/share/gvfs-metadata
rm -rf ~/.local/share/virtualenv
rm -rf ~/.npm   
rm -rf ~/.pylint.d
rm -f ~/.local/share/recently-used.xbel
rm -f ~/.lesshst
rm -f ~/.oh-my-zsh/cache/*
rm -f ~/.viminfo
rm -f ~/.*_history

echo -e '\n##### Cleaning system packages... #####'
pacman -Qdtq | sudo pacman -Rs -
yes | sudo pacman -Scc
exit 0 
