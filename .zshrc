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
  git
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# macports
export PATH="/Users/charliegetzen/bin:$PATH:/opt/local/bin"

# go
alias gosrc='cd $GOPATH/src/github.com'

# kubectl
alias get="kubectl get"
alias delete="kubectl delete"
alias logs="kubectl logs"

# other
alias ls=" ls"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
