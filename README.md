# dotfiles

Dotfiles for my [Arch Linux](https://www.archlinux.org/) installation.

## Software used

- [Chromium](https://www.chromium.org/Home)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Git](https://git-scm.com)
- [libinput-gestures](https://github.com/bulletmark/libinput-gestures)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [systemd-boot](https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/)
- [Vim](https://www.vim.org)
- [Visual Studio Code - Open Source ("Code - OSS")](https://github.com/microsoft/vscode)
- [ZSH](http://zsh.sourceforge.net/)

## Extras

- systemd-boot config
  - `/boot/loader`
- Audio fixes for ThinkPad X1 Carbon (7th Gen), when using SOF drivers
  - Enable top speakers (requires `hda-verb` -- usually part of `alsa-tools` package): `/etc/systemd/system/x1c7-sound-fix.service`
  - Volume control fix: `/usr/share/alsa/ucm2/sof-hda-dsp/HiFi.conf`
- Audio fixes for ThinkPad X1 Carbon (7th Gen), when using Intel HDA drivers
  - Enable top speakers: `/etc/modprobe.d/x1c7-sound.conf`
  - Volume control fix: `/usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf.common`
