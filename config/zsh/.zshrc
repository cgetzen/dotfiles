# Bolt
alias sour=~/github.com/boltApp/source
alias devops=~/github.com/boltApp/devops
alias bolt=~/github.com/boltApp
alias hail=~/github.com/boltApp/source/hail
alias storm=~/github.com/boltApp/source/storm
export BOLTUSR=charlie

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local
export XDG_CACHE_HOME=~/.cache

# XDG Applications
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export PYTHONHISTORY="$XDG_CACHE_HOME/python/python_history"
export HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/oh-my-zsh"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
export LESSHISTFILE=-
export DOCKER_CONFIG="$XDG_DATA_HOME/docker"
export ATOM_HOME="$XDG_CONFIG_HOME/atom"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export GOCACHE="$XDG_CACHE_HOME/go-build"
export SAML2AWS_CONFIGFILE="$XDG_DATA_HOME/saml2aws"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_CACHE_HOME/npm"
export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/terraformrc"
export KUBECONFIG="$XDG_DATA_HOME/kube/config"
export PM2_HOME="$XDG_DATA_HOME/pm2"
# export HELM_REPOSITORY_CONFIG="$XDG_DATA_HOME/helm"
export GH_CONFIG_DIR="$XDG_DATA_HOME/gh"
alias bash="/bin/bash --rcfile $XDG_CONFIG_HOME/bashrc"
ngrok () {
  /usr/local/bin/ngrok "$@" --config "$XDG_DATA_HOME/ngrok2/ngrok.yml"
}

# zsh
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;;
    *) PATH="$1:$PATH";;
  esac
}

export ZSH_THEME="charlieg"
if ! test -d $ZSH; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! test -d $ZSH/plugins/zsh-syntax-highlighting; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
fi

if ! test -d $ZSH/plugins/zsh-autosuggestions; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions
fi

plugins=(
  dotenv
  macos
  zsh-syntax-highlighting
  zsh-autosuggestions
)

DISABLE_UNTRACKED_FILES_DIRTY=true # Fix for slowness in large repos
export  LC_CTYPE="en_US.UTF-8"
source $ZSH/oh-my-zsh.sh

addToPATH "/usr/local/sbin"
addToPATH "/Users/$(whoami)/.local/bin"
addToPATH "$(go env GOPATH)/bin"
# macports
addToPATH "/opt/local/bin"

# git
alias gc="git commit --signoff"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"

# gcloud
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# kubectl
alias get="kubectl get"
alias delete="kubectl delete"
alias logs="kubectl logs"

# other
export PATH=$PATH:$(go env GOPATH)/bin

if [ -e "${XDG_CACHE_HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${XDG_CACHE_HOME}/.iterm2_shell_integration.zsh"
else
  echo "Shell integrations installing in background."
  {
    sleep 3;
    curl -L https://iterm2.com/shell_integration/zsh -o "${XDG_CACHE_HOME}/.iterm2_shell_integration.zsh" 2> /dev/null;
  } &
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux has-session -t 0 2> /dev/null || tmux

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias cat="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias _cat="/bin/cat"
alias _ls="/bin/ls"
alias ls="exa"
alias ping="prettyping"
alias _ping="/sbin/ping"
alias lynx="lynx -vikeys"
alias _lynx="/usr/local/bin/lynx"
