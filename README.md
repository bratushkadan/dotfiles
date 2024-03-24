# bratushkadan's dotfiles

## Arrangement

My dotfiles are managed using GNU Stow. GNU Stow is a "symlink farm manager". Its largest benefit is seamless integration with VCS that allows one to set it up once and reach **only** for the `git commit/push` command if there's a need to change configuration. That's it, once it's configured it just works.

Initializing symlinks is dead simple:

1. `git clone git@github.com:bratushkadan/dotfiles.git ~/dotfiles`
2. `stow .`

### dependencies

- git
- stow

## Completed ✅

- tmux
- git
- zsh
- nvim

## In Progress ⏳

- starship

## Todo 📋

- implement better dotenv files separation for .zshrc
- git
- ssh

