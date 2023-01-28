#!/bin/zsh

function pkg_install() {
	[ "$ID" = "arch" ] && yay -S "$@"
	[ "$ID" = "fedora" ] && sudo dnf install "$@"
}

function pkg_upgrade() {
	echo "==> Updating system packages..."
	[ "$ID" = "arch" ] && yay -Syu
	[ "$ID" = "fedora" ] && sudo dnf upgrade
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
eval "$(grep ^ID= /etc/os-release)"
echo "Detected OS: $ID"
# Install or Upgrade
if [ -z "$@" ]; then
	pkg_upgrade
else
	pkg_install "$@"
fi
