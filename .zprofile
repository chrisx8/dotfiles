# Cargo
[[ ! -f "$HOME/.cargo/env" ]] || . "$HOME/.cargo/env"

# GPG terminal
export GPG_TTY="$TTY"

# Golang
if type go &> /dev/null; then
	export GOPROXY=direct
fi

# Lima
if type lima &> /dev/null; then
	export LIMA_INSTANCE=fedora
fi

# Homebrew
if [ -f /opt/homebrew/bin/brew ]; then
	eval $(/opt/homebrew/bin/brew shellenv)
	export HOMEBREW_NO_ANALYTICS=1
	export HOMEBREW_NO_ENV_HINTS=1
	export PATH="/opt/homebrew/opt/make/libexec/gnubin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
fi
