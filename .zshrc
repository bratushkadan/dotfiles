# Starship shell

eval "$(starship init zsh)"

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

export ARC_MOUNT_PATH="/Users/bratushkadan/.arcadia"
export JOB_VM=bratushkadan-20-cvm.bootstrap.cloud-preprod.yandex.net
export OLD_JOB_VM=bratushkadan.sas.yp-c.yandex.net
#
export DOTFILES="~/dotfiles"

## Aliases
alias arcmount="arc mount -m ~/.arcadia -S ~/.store --allow-other"
alias arcm="arcmount"
alias arcumnt="arc unmount -f ~/.arcadia"
# `ya` executable
alias ya='~/.arcadia/ya'

# Aliases
alias k="kubectl"
alias ku="k9s"
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

