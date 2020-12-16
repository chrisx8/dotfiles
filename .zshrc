# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/home/chris/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load gitstatus binary
[[ -d ~/.cache/gitstatus ]] || ln -s ~/.local/lib/gitstatus ~/.cache

# Powerlevel10k prompt. To customize, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$XDG_SESSION_TYPE" == "tty" ]]; then
	[[ -f ~/.p10k-ascii.zsh ]] && source ~/.p10k-ascii.zsh
else
	[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-auto-fetch npm yarn)

source $ZSH/oh-my-zsh.sh

# Preferred editor
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Command completion
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit
source /etc/bash_completion.d/windscribe_complete

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias docker=podman
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias qr='qrencode -t utf8'
alias usevenv='source venv/bin/activate'
alias youtube-audio-dl='youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 192K'
alias zshupdate='omz update && git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'
