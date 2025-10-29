#!/bin/zsh

echo "==> Updating system packages..."
if type brew &> /dev/null; then
    brew update
    brew upgrade
elif type dnf &> /dev/null; then
    sudo dnf upgrade --refresh
elif type pacman &> /dev/null; then
    yay -Syu
fi
echo
echo "==> Updating user applications..."
if type flatpak &> /dev/null; then
    echo "### flatpak"
    flatpak update
    echo
fi
if type rustup &> /dev/null; then
    echo "### rustup"
    rustup upgrade
    echo
fi
if uv self version &> /dev/null; then
    echo "### uv"
    uv self update
    echo
    echo "### uv tool"
    uv tool upgrade --all
    echo
fi
echo "### powerlevel10k"
git -C "$ZSH/custom/themes/powerlevel10k" pull
echo
echo "### oh-my-zsh"
"$ZSH/tools/upgrade.sh"
