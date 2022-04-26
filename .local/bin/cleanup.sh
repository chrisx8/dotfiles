#!/bin/bash

echo '##### Cleaning cache... #####'
rm -rf ~/.cache/* ~/.cache/.*
rm -rf ~/.config/.cache
rm -rf ~/.local/share/virtualenv
rm -rf ~/.npm
rm -rf ~/.oh-my-zsh/cache/*
rm -rf ~/.pylint.d
rm -rf ~/.vscode-server/data/CachedExtensionVSIXs
rm -f ~/.local/share/recently-used.xbel
rm -f ~/.lesshst
rm -f ~/.viminfo
rm -f ~/.*_history

echo -e '\n##### Cleaning system packages... #####'
sudo dnf autoremove
sudo dnf clean packages

echo -e '\n##### Trimming disk... #####'
sudo fstrim -av

exit 0 
