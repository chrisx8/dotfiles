# dotfiles

Dotfiles for my [Fedora](https://getfedora.org/) installation.

## Software used

- [Chromium](https://www.chromium.org/Home)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Git](https://git-scm.com)
- [GitHub CLI](https://github.com/cli/cli)
- [NetworkManager](https://gitlab.freedesktop.org/NetworkManager/NetworkManager)
- [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Neovim](https://neovim.io/)
- [VSCodium](https://vscodium.com/)
- [Yarn](https://yarnpkg.com/)
- [ZSH](http://zsh.sourceforge.net/)

## Extras

The following files are included in [`.dotfiles/extras`](.dotfiles/extras).

- NetworkManager dispatcher scripts
  - `/etc/NetworkManager/dispatcher.d/99-vpn`: Disable IPv6 when VPN is connected

## Setup

```bash
# Set up repo
git clone --bare https://github.com/chrisx8/dotfiles.git ~/.dotfiles
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dot checkout
dot config --local status.showUntrackedFiles no

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Set up Github CLI
gh auth login
```
