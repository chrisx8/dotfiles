# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    fzf
    golang
    rust
    tailscale
    uv
    zsh-interactive-cd
)

source "$ZSH/oh-my-zsh.sh"

# Powerlevel10k prompt. To customize, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$TERM" == "xterm-"* ]]; then
    source ~/.p10k.zsh
else
    source ~/.p10k-ascii.zsh
fi

# Homebrew
if [ -f /opt/homebrew/bin/brew ]; then
    # Set Homebrew env
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_ENV_HINTS=1
    # Load Homebrew completions
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Cargo
[[ ! -f "$HOME/.cargo/env" ]] || source "$HOME/.cargo/env"

# Git
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gitlogs="git log --show-signature"
alias gitpuf="git push --force-with-lease"
function gitclean {
    git remote prune origin
    git branch --merged | egrep -v "(^\*|master|main)" | xargs git branch -d
}
function gitrw {
    git_web_url="$(git remote get-url origin | sed -r "s/ssh:\/\/.+@/https:\/\//g" | sed -r "s/:[0-9]+//g")"
    echo "Opening $git_web_url"
    if [ "$(uname -s)" = "Darwin" ]; then
        open "$git_web_url"
    else
        xdg-open "$git_web_url"
    fi
}

# Golang
if type go &> /dev/null; then
    export GOPROXY=direct
fi

# Kubernetes
if type kubecolor &> /dev/null; then
    alias k=kubecolor
elif type kubectl &> /dev/null; then
    alias k=kubectl
fi

# Lima
if type lima &> /dev/null; then
    alias limastop='limactl stop "$LIMA_INSTANCE"'
    export LIMA_INSTANCE=fedora
fi

# Neovim
if type nvim &> /dev/null; then
    alias vi=nvim
    alias vim=nvim
    export EDITOR=nvim
fi

# Python
function venv {
    if [ ! -d .venv ]; then
        echo "Using $(python3 -V)"
        read -q "choice?Can't find .venv in the current working directory. Create a venv? (y/n) "
        echo
        [[ "$choice" == "y" ]] || return 1
        uv venv --seed .venv
    fi
    echo "Activating venv"
    source .venv/bin/activate
}

# QR code
alias qr='qrencode -t utf8'

# MacOS specific
if [ "$(uname -s)" = "Darwin" ]; then
    alias sha256sum='shasum -a 256'
    alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
fi

# Command completion
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit

# GPG terminal
export GPG_TTY="$TTY"

# Local bin directory
export PATH="$HOME/.local/bin:$PATH"
