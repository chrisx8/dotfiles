#!/bin/bash
set -e

# Detect OS
[ -n "$OS" ] || OS="$(uname -s)"
echo "Detected OS: $OS"

# Clean repo
rm -fv .DS_Store

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# Link dotfiles
find "$(pwd)" -maxdepth 1 -type f -name '.*' -exec ln -sfv "{}" "$HOME" ";"
mkdir -p "$HOME/.local/bin"
find "$(pwd)/.local/bin" -type f -exec ln -sfv "{}" "$HOME/.local/bin" ";"
mkdir -p "$HOME/.config/gh"
ln -sfv "$(pwd)/.config/gh/config.yml" "$HOME/.config/gh/config.yml"
ln -sfv "$(pwd)/.config/nvim" "$HOME/.config"
mkdir -p "$HOME/.config/opencode"
ln -sfv "$(pwd)/.config/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"

# Link OS-dependent dotfiles
if [ "$OS" = "Darwin" ]; then
    mkdir -p "$HOME/Library/Application Support/Code/User"
    mkdir -p "$HOME/Library/Application Support/VSCodium/User"
    ln -sfv "$(pwd)/.vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sfv "$(pwd)/.vscode/settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
    mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
    ln -sfv "$(pwd)/.config/ghostty/config.ghostty" "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
elif [ "$OS" = "Linux" ]; then
    mkdir -p "$HOME/.config/Code/User"
    mkdir -p "$HOME/.config/VSCodium/User"
    ln -sfv "$(pwd)/.vscode/settings.json" "$HOME/.config/Code/User/settings.json"
    ln -sfv "$(pwd)/.vscode/settings.json" "$HOME/.config/VSCodium/User/settings.json"
    mkdir -p "$HOME/.config/ghostty"
    ln -sfv "$(pwd)/.config/ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"
fi

# Create Git credential helper config
if [ "$OS" = "Darwin" ]; then
    cat >~/.gitconfig_local <<EOF
[credential]
    helper = osxkeychain
[gpg "ssh"]
    program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
EOF
else
    cat >~/.gitconfig_local <<EOF
[credential "https://github.com"]
    helper =
    helper = !/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
    helper =
    helper = !/usr/bin/gh auth git-credential
[gpg "ssh"]
    program = "/opt/1Password/op-ssh-sign"
EOF
fi

# Create Git remote-specific config
for dir in ~/Git/*; do
    cat >>~/.gitconfig_local <<EOF
[includeIf "gitdir:$dir/"]
    path = $dir/.gitconfig
EOF
done
