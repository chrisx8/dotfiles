# dotfiles

Personal dotfiles for macOS and Linux, managed with [chezmoi](https://chezmoi.io).

OS-specific differences are handled with chezmoi templates.

## Initial setup

1. [Install chezmoi](https://www.chezmoi.io/install/)
2. Initialize from this repo and apply

```sh
chezmoi init --apply chrisx8
```

On first use, chezmoi scripts automatically installs Oh My Zsh and generates git
config.

## Updating

Pull the latest changes and apply:

```sh
chezmoi update
```

To preview changes before applying:

```sh
chezmoi diff
chezmoi apply
```

## Making changes

Add or edit managed files then commit and push from the source directory:

```sh
chezmoi edit ~/.zshrc     # edit a managed file
chezmoi add ~/.tmux.conf  # start managing a file
chezmoi cd                # cd into the source repo to commit and push
```

## License

MIT License. Copyright (c) 2026 Chris Xiao.
