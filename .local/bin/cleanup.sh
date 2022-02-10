#!/bin/bash

echo '##### Cleaning cache... #####'
rm -rf ~/.cache/* ~/.cache/.*
rm -rf ~/.config/.cache
rm -rf ~/.config/chromium/*/Service\ Worker
rm -rf ~/.config/chromium/Guest\ Profile
rm -rf ~/.config/VSCodium/*Cache*
rm -rf ~/.config/VSCodium/logs
rm -rf ~/.config/VSCodium/Service\ Worker
rm -rf ~/.gnome
rm -rf ~/.local/share/gvfs-metadata
rm -rf ~/.local/share/RecentDocuments
rm -rf ~/.local/share/virtualenv
rm -rf ~/.npm   
rm -rf ~/.oh-my-zsh/cache/*
rm -rf ~/.pylint.d
rm -rf ~/.var/app/org.signal.Signal/config/Signal/*Cache*
rm -rf ~/.var/app/org.signal.Signal/config/Signal/logs
rm -rf ~/.var/app/org.signal.Signal/config/Signal/temp
rm -f ~/.local/share/recently-used.xbel
rm -f ~/.lesshst
rm -f ~/.viminfo
rm -f ~/.*_history

echo -e '\n##### Cleaning Flatpak packages... #####'
flatpak remove --unused

echo -e '\n##### Cleaning system packages... #####'
sudo dnf autoremove
sudo dnf clean packages

exit 0 
