#!/bin/bash
set -ux

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Create Git remote-specific config
for dir in ~/Git/*; do
    cat >>~/.gitconfig_local <<EOF
[includeIf "gitdir:$dir/"]
    path = $dir/.gitconfig
EOF
done
