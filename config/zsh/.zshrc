# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.data
export XDG_CACHE_HOME=~/.cache
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export PYTHONHISTORY="$XDG_CACHE_HOME/python/python_history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/oh-my-zsh"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
export LESSHISTFILE=-
export DOCKER_CONFIG="$XDG_DATA_HOME/docker"
export ATOM_HOME="$XDG_CONFIG_HOME/atom"

# zsh
ZSH_THEME="charlieg"
if ! test -d $ZSH; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! test -d $ZSH/custom/plugins/zsh-syntax-highlighting; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi

if ! test -d $ZSH/custom/plugins/zsh-autosuggestions; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
fi

plugins=(
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

DISABLE_UNTRACKED_FILES_DIRTY=true # Fix for slowness in large repos
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"
# macports
export PATH="/Users/$(whoami)/bin:$PATH:/opt/local/bin"

# go
alias gosrc='cd ~/go/src/github.com'

# kubectl
alias get="kubectl get"
alias delete="kubectl delete"
alias logs="kubectl logs"

# other
# export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(rbenv init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux has-session -t 0 2> /dev/null || tmux

# heroku autocomplete setup
#HEROKU_AC_ZSH_SETUP_PATH=/Users/$(whoami)/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

alias cat="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias _cat="/bin/cat"
alias _ls="/bin/ls"
alias ls="exa"
alias ping="prettyping"
alias _ping="/sbin/ping"
alias lynx="lynx -vikeys"
alias _lynx="/usr/local/bin/lynx"
