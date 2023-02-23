#!/bin/zsh

echo "==> Updating system packages..."
if type brew &> /dev/null; then
	brew update
	brew upgrade
elif type dnf &> /dev/null; then
	sudo dnf upgrade
elif type pacman &> /dev/null; then
	yay -Syu
fi
echo
echo "==> Updating user applications..."
if type rustup &> /dev/null; then
	echo "### rustup"
	rustup upgrade
	echo
fi
echo "### powerlevel10k"
git -C "$ZSH/custom/themes/powerlevel10k" pull
echo
echo "### oh-my-zsh"
"$ZSH/tools/upgrade.sh"
