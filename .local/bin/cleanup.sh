#!/bin/bash

OS="$(uname -s)"
echo "Detected OS: $OS"

echo -e '##### Cleaning cache... #####'
rm -rf ~/.lldb
rm -rf ~/.npm
rm -f ~/.lesshst
rm -rf ~/.oh-my-zsh/cache/*
rm -f ~/.viminfo
rm -f ~/.*_history
if [ "$OS" = "Darwin" ]; then
    rm -rf ~/Library/Application\ Support/Arc/User\ Data/*/Service\ Worker
    rm -rf ~/Library/Application\ Support/BraveSoftware/Brave-Browser/*/Service\ Worker
    rm -rf ~/Library/Application\ Support/BraveSoftware/Brave-Browser/Guest\ Profile
    rm -rf ~/Library/Application\ Support/Code/*Cache*
    rm -rf ~/Library/Application\ Support/Code/logs
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker
    rm -rf ~/Library/Application\ Support/Google/Chrome/*/Service\ Worker
    rm -rf ~/Library/Application\ Support/Google/Chrome/Guest\ Profile
    rm -rf ~/Library/Application\ Support/Signal/*Cache*
    rm -rf ~/Library/Application\ Support/Signal/logs
    rm -rf ~/Library/Application\ Support/Signal/temp
    rm -rf ~/Library/Application\ Support/VSCodium/*Cache*
    rm -rf ~/Library/Application\ Support/VSCodium/logs
    rm -rf ~/Library/Application\ Support/VSCodium/Service\ Worker
    rm -rf ~/Library/Caches/BraveSoftware
    rm -rf ~/Library/Caches/Firefox
    rm -rf ~/Library/Caches/Google
    rm -rf ~/Library/Caches/lima
    rm -rf ~/Library/Caches/Microsoft
    rm -rf ~/Library/Caches/Mozilla
    rm -rf ~/Library/Caches/pip
    rm -rf ~/Library/Caches/com.microsoft.VSCode*
    rm -rf ~/Library/Caches/im.riot.app*
    rm -rf ~/Library/Caches/js-v8flags
    rm -rf ~/Library/Caches/node-gyp
    rm -rf ~/Library/Caches/org.swift.swiftpm
    rm -rf ~/Library/Caches/org.whispersystems.signal-desktop*
    rm -rf ~/Library/Caches/typescript
    rm -rf ~/Library/Caches/us.zoom.xos
    rm -rf ~/Library/Caches/vscode-cpptools
elif [ "$OS" = "Linux" ]; then
    rm -rf ~/.config/.cache
    rm -rf ~/.config/chromium/*/Service\ Worker
    rm -rf ~/.config/chromium/Guest\ Profile
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
    rm -rf ~/.pylint.d
    rm -rf ~/.vscode-server/data/CachedExtensionVSIXs
    rm -f ~/.local/share/recently-used.xbel
fi

echo -e '\n##### Cleaning packages... #####'
if type brew &>/dev/null; then
    brew autoremove
    brew cleanup --prune=all
elif type dnf &>/dev/null; then
    sudo dnf autoremove
    sudo dnf clean packages
elif type pacman &>/dev/null; then
    pacman -Qdtq | sudo pacman -Rs -
    yes | yay -Scc
fi
