#!/bin/zsh

# Detect OS
eval "$(grep ^ID= /etc/os-release 2> /dev/null)"
echo "Detected OS: $ID"

echo "==> Updating system packages..."
if [ "$ID" = "arch" ] || [ "$ID" = "archarm" ]; then
    yay -Syu
elif [ "$ID" = "fedora" ]; then
    sudo dnf upgrade
fi
echo
echo "==> Updating user applications..."
echo "### rustup"
rustup upgrade
echo
echo "### powerlevel10k"
git -C "$ZSH/custom/themes/powerlevel10k" pull
echo
echo "### oh-my-zsh"
"$ZSH/tools/upgrade.sh"
