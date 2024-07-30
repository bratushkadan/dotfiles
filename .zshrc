# Starship shell

eval "$(starship init zsh)"

# https://stackoverflow.com/a/74323525
autoload -Uz compinit
compinit

source $HOME/.env_common

source ~/.zshrc_work

# pyenv
export PATH="$(pyenv root)/shims:$PATH"

# go
export PATH="$PATH:$HOME/go/bin"

# terraform
export TFENV_REMOTE='https://hashicorp-releases.yandexcloud.net/'

# export BASH_SILENCE_DEPRECATION_WARNING=1 # add this to /etc/profile if using Bash on OSX

# Work

## Setup
fpath+=~/.zfunc

FPATH="/Users/$USER/.zsh/:$FPATH"

## Vars
export BROWSER="firefox"
#
export DOTFILES="~/dotfiles"
#
export EXTREME_SSD_PATH="/Volumes/Extreme SSD"
export VMS_SSD_PATH="/Volumes/vms"

# set up kubectl
source <(kubectl completion zsh)
# set up helm
source <(helm completion zsh)
# short alias to set/show context/namespace (only works for bash and bash-compatible shells, current context to be set before using kn to set namespace)
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
alias kpf='kubectl port-forward'
# set up autocompletion to work with alias "k"; NOTE: works without it in zsh
# alias k=kubectl
# complete -o default -F __start_kubectl k

# Aliases
## k8s
alias k="kubectl"
alias ku="k9s"
alias kctx="kubectx"
alias kns="kubens"
# alias python="python3"
alias pip="pip3"

## docker
# alias dockpsids="docker ps -a | awk '{if (NR > 1) { print $1 }}'"
# alias docrma="dockpsids | xargs docker rm -f"


# Nvim

## Use Neovim as "preferred editor"
export VISUAL=nvim
export VIMCONFIG=~/.config/nvim
## nvim & misc plugins
export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin
## Use Neovim insead of Vim or Vi
alias vim=nvim
alias vi=nvim
alias v=nvim
## nvim plugins
# export NVIM_FUGITIVE_GITLAB_DOMAINS="$NVIM_FUGITIVE_GITLAB_DOMAINS,"
# example: NVIM_FUGITIVE_GITLAB_DOMAINS="ssh://git@gitlab.gitlab.cntry:12112=https://gitlab.company_name.cntry:3344"

# Software

## sdkman - java version manager
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## Obsidian
export OBSIDIAN_VAULT=~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Dan\'s\ vault
export OBSIDIAN_CONF=~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Dan\'s\ vault/.obsidian
export OBSIDIAN_SNIPPETS=$OBSIDIAN/snippets

## python3
export PYTHONPATH=$PYTHONPATH:`pwd`;

## Go
export GOPATH=~/go

## Yandex Cloud CLI
if [ -f '/Users/bratushkadan/yandex-cloud/path.bash.inc' ]; then source '/Users/bratushkadan/yandex-cloud/path.bash.inc'; fi
if [ -f '/Users/bratushkadan/yandex-cloud/completion.zsh.inc' ]; then source '/Users/bratushkadan/yandex-cloud/completion.zsh.inc'; fi

## nvm - nodejs version manager
# export NVM_DIR=$HOME/.nvm;
# source $NVM_DIR/nvm.sh;
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

