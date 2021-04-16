# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="charlieg"

if ! test -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if ! test -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
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
# eval $(thefuck --alias)
# source /usr/local/share/zsh/site-functions/_awless

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.rbenv/bin:$PATH"
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
