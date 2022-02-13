#!/bin/zsh

[[ -z "$@" ]] || return 1

echo "==> Updating system packages..."
sudo dnf update
echo
echo "==> Updating Flatpak packages..."
flatpak update
echo
echo "==> Updating user applications..."
echo "### docker-compose v2"
ver=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .name)
if [[ "$(docker-compose version | awk '{print $4}')" != "$ver" ]]; then
	curl -Lo ~/.local/bin/docker-compose "https://github.com/docker/compose/releases/download/$ver/docker-compose-linux-x86_64"
	echo "Updated docker-compose to $ver"
else
	echo "docker-compose $ver is up-to-date"
fi
echo
echo "### rustup"
rustup upgrade
echo
echo "### oh-my-zsh"
source ~/.alias
source "$ZSH/oh-my-zsh.sh"
zshupdate
echo
