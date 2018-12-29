# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="charlieg"

plugins=(
  git
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# other
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
