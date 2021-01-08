# dotfiles

Dotfiles for my [Arch Linux](https://www.archlinux.org/) installation.

## Software used

- [Chromium](https://www.chromium.org/Home)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Git](https://git-scm.com)
- [GitHub CLI](https://github.com/cli/cli)
- [libinput-gestures](https://github.com/bulletmark/libinput-gestures)
- [NetworkManager](https://gitlab.freedesktop.org/NetworkManager/NetworkManager)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [systemd-boot](https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/)
- [Vim](https://www.vim.org)
- [Visual Studio Code - Open Source (Code - OSS)](https://github.com/microsoft/vscode)
- [Yarn](https://yarnpkg.com/)
- [ZSH](http://zsh.sourceforge.net/)

## Extras

- systemd-boot config
  - `/boot/loader`
- NetworkManager dispatcher scripts
  - `/etc/NetworkManager/dispatcher.d/99-vpn`: Disable IPv6 when VPN is connected
- Pacman hooks
  - `/etc/pacman.d/hooks/10-code.hook` and `/etc/pacman.d/hooks/product.json.patch`: Patch Code - OSS to use Microsoft VSCode extension store
  - `/etc/pacman.d/hooks/10-fcitx5.hook`: Disable autostart for fcitx5
  - `/etc/pacman.d/hooks/90-systemd-boot.hook`: Update systemd-boot when systemd updates
- Audio fixes for ThinkPad X1 Carbon (7th Gen), when using SOF drivers
  - Kernel 5.5 and later should use SOF by default. Installation of `sof-firmware` is required.
  - No fix needed on kernel 5.8.12 or later with latest alsa-ucm-conf and PulseAudio 13.99.1 or later.
- Audio fixes for ThinkPad X1 Carbon (7th Gen), when using Intel HDA drivers
  - Kernel 5.4 and earlier uses Intel HDA drivers by default. Fix needed to enable all four speakers and proper volume control.
  - Enable top speakers: `/etc/modprobe.d/x1c7-sound.conf`
  - Volume control fix: `/usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf.common`

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
