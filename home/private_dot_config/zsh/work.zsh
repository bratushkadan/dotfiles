export TFENV_REMOTE=https://hashicorp-releases.yandexcloud.net

if (( $+commands[kubectl] )); then
  function kubectl() {
    unfunction kubectl
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

if (( $+commands[helm] )); then
  function helm() {
    unfunction helm
    source <(command helm completion zsh)
    command helm "$@"
  }
fi

# Kubernetes context and namespace shortcuts
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
alias kpf='kubectl port-forward'
alias k="kubectl"
alias ku="k9s"
alias kctx="kubectx"
alias kns="kubens"

function yc() {
    unfunction "$0"
    add-zsh-hook -d precmd lazy_load_autocomplete

    if [ -f "$HOME/yandex-cloud/path.bash.inc" ]; then source "$HOME/yandex-cloud/path.bash.inc"; fi
    if [ -f "$HOME/yandex-cloud/completion.zsh.inc" ]; then source "$HOME/yandex-cloud/completion.zsh.inc"; fi

    $0 "$@"
}

function _handle_yc_completions() {
  if [ -f "$HOME/yandex-cloud/path.bash.inc" ]; then source "$HOME/yandex-cloud/path.bash.inc"; fi
  if [ -f "$HOME/yandex-cloud/completion.zsh.inc" ]; then source "$HOME/yandex-cloud/completion.zsh.inc"; fi
  _main_complete
}

function lazy_load_autocomplete() {
  add-zsh-hook -d precmd lazy_load_autocomplete

  if (( $+commands[yc] )) || [[ -f "$HOME/yandex-cloud/path.bash.inc" ]]; then
    compdef _handle_yc_completions yc
    return
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd lazy_load_autocomplete
