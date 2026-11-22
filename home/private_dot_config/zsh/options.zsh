export PATH="/usr/local/bin:$PATH"

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

if (( $+commands[brew] )); then
  _dotfiles_brew_prefix=${HOMEBREW_PREFIX:-$(brew --prefix)}
  for _dotfiles_plugin in zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search; do
    _dotfiles_plugin_file="$_dotfiles_brew_prefix/share/$_dotfiles_plugin/$_dotfiles_plugin.zsh"
    [[ -r $_dotfiles_plugin_file ]] && source "$_dotfiles_plugin_file"
  done
  unset _dotfiles_brew_prefix _dotfiles_plugin _dotfiles_plugin_file
fi

if [[ -f "$HOME/.env" ]]; then
  set -a
  source "$HOME/.env"
  set +a
else
  (umask 027 && touch "$HOME/.env")
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
