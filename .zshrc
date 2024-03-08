# Starship shell

eval "$(starship init zsh)"


# Nvim

## Use Neovim as "preferred editor"
export VISUAL=nvim
export VIMCONFIG=~/.config/nvim
## nvim & misc plugins
export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin
## Use Neovim insead of Vim or Vi
alias vim=nvim
alias vi=nvim

# Software

## sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## Obsidian
export OBSIDIAN=~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Dan\'s\ vault/.obsidian
export OBSIDIAN_SNIPPETS=$OBSIDIAN/snippets

## python3
export PYTHONPATH=$PYTHONPATH:`pwd`;

## Go
export GOPATH=~/go

## Yandex Cloud CLI
if [ -f '/Users/bratushkadan/yandex-cloud/path.bash.inc' ]; then source '/Users/bratushkadan/yandex-cloud/path.bash.inc'; fi
if [ -f '/Users/bratushkadan/yandex-cloud/completion.zsh.inc' ]; then source '/Users/bratushkadan/yandex-cloud/completion.zsh.inc'; fi

## nvm
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
