#!/bin/bash
set -e

# Detect OS
eval "$(grep ^ID= /etc/os-release 2> /dev/null)"
[ -n "$ID" ] || ID="$(uname -s)"
echo "Detected OS: $ID"

# Link dotfiles
find "$(pwd)" -type f -name '.*' -exec ln -sfv "{}" "$HOME" ";"
find "$(pwd)/.local/bin" -type f -exec ln -sfv "{}" "$HOME/.local/bin" ";"
ln -sfv "$(pwd)/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# Link OS-dependent dotfiles
if [ "$ID" = "arch" ] || [ "$ID" = "archarm" ]; then
	ln -sfv "$(pwd)/.config/chromium-flags.conf" "$HOME/.config/chromium-flags.conf"
elif [ "$ID" = "Darwin" ]; then
	ln -sfv "$(pwd)/Library/Application Support/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
fi

# Create Git credential helper config
if [ "$ID" = "Darwin" ]; then
	cat > ~/.gitconfig_credential <<EOF
[credential]
	helper = osxkeychain
EOF
else
	cat > ~/.gitconfig_credential <<EOF
[credential "https://github.com"]
	helper = 
	helper = !/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = 
	helper = !/usr/bin/gh auth git-credential
EOF
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Install vim-plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
