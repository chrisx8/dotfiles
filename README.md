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
- [Visual Studio Code](https://code.visualstudio.com/)
- [ZSH](http://zsh.sourceforge.net/)

## Extras

- systemd-boot config
  - `/boot/loader`
- Audio fixes for ThinkPad X1 Carbon (7th Gen), when using SOF drivers
  - Kernel 5.5 and later should use SOF by default. Installation of `sof-firmware` is required.
  - Fix no longer needed on kernel 5.8.12 or later with latest alsa-ucm-conf and PulseAudio 13.99.1 or later.
  - ~~Enable top speakers (requires `hda-verb` -- usually part of `alsa-tools` package): `/etc/systemd/system/x1c7-sound-fix.service`~~
  - ~~Volume control fix: `/usr/share/alsa/ucm2/sof-hda-dsp/HiFi.conf`~~
- Audio fixes for ThinkPad X1 Carbon (7th Gen), when using Intel HDA drivers
  - Kernel 5.4 and earlier uses Intel HDA drivers by default. Fix needed to enable all four speakers and proper volume control.
  - Enable top speakers: `/etc/modprobe.d/x1c7-sound.conf`
  - Volume control fix: `/usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf.common`
