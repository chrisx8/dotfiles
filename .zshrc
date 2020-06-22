# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/home/chris/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load gitstatus binary
[[ -d ~/.cache/gitstatus ]] || ln -s ~/.local/bin/gitstatus ~/.cache

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
plugins=()

source $ZSH/oh-my-zsh.sh

# Preferred editor
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Command completion
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit
complete -C aws_completer aws

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias qr='qrencode -t utf8'
alias usevenv='source venv/bin/activate'
alias youtube-audio-dl='youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 192K'
