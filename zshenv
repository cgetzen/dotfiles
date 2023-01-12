if [[ -z "$XDG_CONFIG_HOME" ]]; then
        export XDG_CONFIG_HOME="$HOME/.config"
fi
if [[ -z "$XDG_CACHE_HOME" ]]; then
	export XDG_CACHE_HOME="$HOME/.cache"
fi
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zcompdump-${ZSH_VERSION}"
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
fi

