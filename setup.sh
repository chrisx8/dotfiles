#!/bin/bash
set -e

# Detect OS
[ -n "$OS" ] || OS="$(uname -s)"
echo "Detected OS: $OS"

# Install AstroNvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# Link dotfiles
find "$(pwd)" -type f -name '.*' -exec ln -sfv "{}" "$HOME" ";"
mkdir -p "$HOME/.local/bin"
find "$(pwd)/.local/bin" -type f -exec ln -sfv "{}" "$HOME/.local/bin" ";"
mkdir -p "$HOME/.config/nvim/lua"
ln -sfv "$(pwd)/.config/nvim/lua/user" "$HOME/.config/nvim/lua/user"

# Link OS-dependent dotfiles
if [ "$OS" = "Darwin" ]; then
    mkdir -p "$HOME/Library/Application Support/Code/User"
    ln -sfv "$(pwd)/.vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
elif [ "$OS" = "Linux" ]; then
    mkdir -p "$HOME/.config/Code/User"
    ln -sfv "$(pwd)/.vscode/settings.json" "$HOME/.config/Code/User/settings.json"
fi

# Create Git credential helper config
if [ "$OS" = "Darwin" ]; then
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
