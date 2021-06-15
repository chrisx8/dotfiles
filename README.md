# dotfiles

Dotfiles for my [Arch Linux](https://www.archlinux.org/) installation.

## Software used

- [Chromium](https://www.chromium.org/Home)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Git](https://git-scm.com)
- [GitHub CLI](https://github.com/cli/cli)
- [NetworkManager](https://gitlab.freedesktop.org/NetworkManager/NetworkManager)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [systemd-boot](https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/)
- [systemd-cryptenroll](https://www.freedesktop.org/software/systemd/man/systemd-cryptenroll.html)
- [Vim](https://www.vim.org)
- [VSCodium](https://vscodium.com/)
- [Yarn](https://yarnpkg.com/)
- [ZSH](http://zsh.sourceforge.net/)

## Extras

The following files are included in [`.dotfiles/extras`](.dotfiles/extras).

- systemd-boot config
  - `/boot/loader`
- NetworkManager dispatcher scripts
  - `/etc/NetworkManager/dispatcher.d/99-vpn`: Disable IPv6 when VPN is connected
- Pacman hooks
  - `/etc/pacman.d/hooks/10-code.hook` and `/etc/pacman.d/hooks/product.json.patch`: Patch Code - OSS to use Microsoft VSCode extension store
  - `/etc/pacman.d/hooks/90-systemd-boot.hook`: Update systemd-boot when systemd updates

## Setup

[Decrypt LUKS2-encrypted root partitions with TPM2](https://gist.github.com/chrisx8/cda23e2d1fa3dcda0d739bc74f600175)

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
