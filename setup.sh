#!/bin/bash
set -e

# Detect OS
eval "$(grep ^ID= /etc/os-release 2> /dev/null)"
[ -n "$ID" ] || ID="$(uname -s)"
echo "Detected OS: $ID"

# Link dotfiles
find "$(pwd)" -type f -name '.*' -exec ln -sfv "{}" "$HOME" ";"
mkdir -p "$HOME/.local/bin"
find "$(pwd)/.local/bin" -type f -exec ln -sfv "{}" "$HOME/.local/bin" ";"
mkdir -p "$HOME/.config/nvim"
ln -sfv "$(pwd)/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# Link OS-dependent dotfiles
if [ "$ID" = "Darwin" ]; then
	ln -sfv "$(pwd)/Library/Application Support/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
fi

# Create Git credential helper config
if [ "$ID" = "Darwin" ]; then
	cat > ~/.gitconfig_local <<EOF
[credential]
	helper = osxkeychain
EOF
else
	cat > ~/.gitconfig_local <<EOF
[credential "https://github.com"]
	helper =
	helper = !/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper =
	helper = !/usr/bin/gh auth git-credential
EOF
fi

# Create Git remote-specific config
for dir in ~/Git/*; do
	cat >> ~/.gitconfig_local <<EOF
[includeIf "gitdir:$dir/"]
	path = $dir/.gitconfig
EOF
done

# Install vim-plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
