#!/bin/bash

echo '##### Cleaning cache... #####'
rm -rf ~/.cache/*
rm -rf "$HOME/.config/chromium/Default/Service Worker"
rm -rf "$HOME/.config/Code - OSS/Cache"
rm -rf "$HOME/.config/Code - OSS/CachedData"
rm -rf "$HOME/.config/Code - OSS/CachedExtensions"
rm -rf "$HOME/.config/Code - OSS/CachedExtensionVSIXs"
rm -rf "$HOME/.config/Code - OSS/Code Cache"
rm -rf "$HOME/.config/Code - OSS/GPUCache"
rm -rf "$HOME/.config/Signal/Cache"
rm -rf "$HOME/.config/Signal/Code Cache"
rm -rf "$HOME/.config/Signal/GPUCache"
rm -rf "$HOME/.config/Signal/temp"
rm -rf ~/.gnome
rm -rf ~/.local/share/gvfs-metadata
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
