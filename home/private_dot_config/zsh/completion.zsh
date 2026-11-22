fpath+=("$HOME/.zfunc")
fpath=("$HOME/.zsh" "${fpath[@]}")

autoload -Uz compinit
_dotfiles_compdump="${ZDOTDIR:-$HOME}/.zcompdump"
# Reuse a completion cache that is less than a day old.
_dotfiles_fresh_compdump=( "$_dotfiles_compdump"(N.mh-24) )
if (( $#_dotfiles_fresh_compdump )); then
  compinit -C -d "$_dotfiles_compdump"
else
  compinit -d "$_dotfiles_compdump"
fi
unset _dotfiles_compdump _dotfiles_fresh_compdump
