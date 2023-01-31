#!/bin/zsh

function pkg_install() {
	if [ "$ID" = "arch" ] || [ "$ID" = "archarm" ]; then
		yay -S "$@"
	elif [ "$ID" = "fedora" ]; then
		sudo dnf install "$@"
	fi
}

function pkg_upgrade() {
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
}

# Detect OS
eval "$(grep ^ID= /etc/os-release 2> /dev/null)"
echo "Detected OS: $ID"

# Install or Upgrade
if [ -z "$@" ]; then
	pkg_upgrade
else
	pkg_install "$@"
fi
