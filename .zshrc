# Starship shell

export PATH="/usr/local/bin:$PATH"

eval "$(starship init zsh)"

# zsh opts

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# history opts

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"

# https://stackoverflow.com/a/74323525
# autoload -Uz compinit && compinit
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

[ -f "${HOME}/.env_common" ] && source "${HOME}/.env_common"

[ -f "${HOME}/.zshrc_work" ] && source "${HOME}/.zshrc_work"

# pyenv
# export PATH="$(pyenv root)/shims:$PATH"

# go
export GOPATH="$(go env GOPATH)"
export PATH="$PATH:$GOPATH/bin"

# terraform
export TFENV_REMOTE='https://hashicorp-releases.yandexcloud.net/'

# export BASH_SILENCE_DEPRECATION_WARNING=1 # add this to /etc/profile if using Bash on OSX

# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

# eza
alias lss="/bin/ls"
alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias lst="eza --tree --level=2"

# zoxide - cd replacement
eval "$(zoxide init zsh --cmd j)"
alias cd="j"


# Utility aliases
alias cpwd="pwd | pbcopy"

# Work

## Setup
fpath+=~/.zfunc

FPATH="/Users/$USER/.zsh/:$FPATH"

## Vars
export BROWSER="firefox"
#
export DOTFILES="~/dotfiles"

# set up kubectl
function kubectl() {
    unfunction "$0"

    source <(kubectl completion zsh)

    $0 "$@"
}

# set up helm
function helm() {
    unfunction "$0"

    source <(helm completion zsh)

    $0 "$@"
}

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

## tfenv - Terraform installations manager: https://github.com/tfutils/tfenv
# Bypass Terraform geo restrictions:
export TFENV_REMOTE=https://hashicorp-releases.yandexcloud.net

## sdkman - java version manager
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## Obsidian
# export OBSIDIAN_VAULT=~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Dan\'s\ vault
# export OBSIDIAN_CONF=~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Dan\'s\ vault/.obsidian
# export OBSIDIAN_SNIPPETS=$OBSIDIAN/snippets

## python3
# export PYTHONPATH=$PYTHONPATH:`pwd`;

## Yandex Cloud CLI
# function yc() {
#     unfunction "$0"
# 
#     if [ -f "/Users/${USER}/yandex-cloud/path.bash.inc" ]; then source "/Users/${USER}/yandex-cloud/path.bash.inc"; fi
#     if [ -f "/Users/${USER}/yandex-cloud/completion.zsh.inc" ]; then source "/Users/${USER}/yandex-cloud/completion.zsh.inc"; fi
# 
#     $0 "$@"
# }

## Attempt 2
# function load_yc_and_completion() {
#   echo "load_yc_and_completion"
#   if [ -f "/Users/${USER}/yandex-cloud/path.bash.inc" ];
#     then source "/Users/${USER}/yandex-cloud/path.bash.inc";
#   fi
#   if [ -f "/Users/${USER}/yandex-cloud/completion.zsh.inc" ];
#     then source "/Users/${USER}/yandex-cloud/completion.zsh.inc";
#   fi
# 
#   unfunction _yc_completion_loader
# }
# 
# function _yc_completion_loader() {
#     load_yc_and_completion
#     # After loading, retry the completion request
#     compdef yc
#     compdef _files yc  # Or whatever specific function handles 'yc' completions
#     compinit
#     _main_complete  # Retry the completion logic
# }
# 
# compdef _yc_completion_loader yc
## Attempt 3
function yc() {
    unfunction "$0"
    add-zsh-hook -d precmd lazy_load_autocomplete

    if [ -f "/Users/${USER}/yandex-cloud/path.bash.inc" ]; then source "/Users/${USER}/yandex-cloud/path.bash.inc"; fi
    if [ -f "/Users/${USER}/yandex-cloud/completion.zsh.inc" ]; then source "/Users/${USER}/yandex-cloud/completion.zsh.inc"; fi

    $0 "$@"
}

function _handle_yc_completions() {
  if [ -f "/Users/${USER}/yandex-cloud/path.bash.inc" ]; then source "/Users/${USER}/yandex-cloud/path.bash.inc"; fi
  if [ -f "/Users/${USER}/yandex-cloud/completion.zsh.inc" ]; then source "/Users/${USER}/yandex-cloud/completion.zsh.inc"; fi
  _main_complete
}

function lazy_load_autocomplete() {
  add-zsh-hook -d precmd lazy_load_autocomplete

  if command -v yc >/dev/null 2>&1; then
    compdef _handle_yc_completions yc
    return
  fi
}

add-zsh-hook precmd lazy_load_autocomplete

## nvm - nodejs version manager
# export NVM_DIR=$HOME/.nvm;
# source $NVM_DIR/nvm.sh;
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for YDB CLI.
if [ -f '/Users/bratushkadan/ydb/path.bash.inc' ]; then source '/Users/bratushkadan/ydb/path.bash.inc'; fi
