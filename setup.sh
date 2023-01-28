#!/bin/bash
set -e

# Link dotfiles
find "$(pwd)" -type f -name '.*' -exec ln -sfv "{}" "$HOME" ";"
find "$(pwd)/.local/bin" -type f -exec ln -sfv "{}" "$HOME/.local/bin" ";"
ln -sfv "$(pwd)/.config/chromium-flags.conf" "$HOME/.config/chromium-flags.conf"
ln -sfv "$(pwd)/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Install vim-plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
