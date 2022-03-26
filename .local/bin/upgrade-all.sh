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
	curl -Lo ~/.local/bin/docker-compose "https://github.com/docker/compose/releases/download/$ver/docker-compose-$(uname -s)-$(uname -m)"
	echo "Updated docker-compose to $ver"
else
	echo "docker-compose $ver is up-to-date"
fi
echo
echo "### nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
echo
echo "### rustup"
rustup upgrade
echo
echo "### powerlevel10k"
git -C "$ZSH/custom/themes/powerlevel10k" pull
echo
echo "### oh-my-zsh"
"$ZSH/tools/upgrade.sh"
exit 0
