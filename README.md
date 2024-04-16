# bratushkadan's dotfiles

## OSX

### Brew

*Brewfile* is a collection of casks/formulas/taps needed to set up the system for user's demands.

`brew bundle dump -f` writes current system's brew state into a file, `brew bundle -v` installs the dependencies listed in the *Brewfile*.

## Arrangement

My dotfiles are managed using GNU Stow. GNU Stow is a "symlink farm manager". Its largest benefit is seamless integration with VCS that allows one to set it up once and reach **only** for the `git commit/push` command if there's a need to change configuration. That's it, once it's configured it just works.

Initializing symlinks is dead simple:

1. `git clone git@github.com:bratushkadan/dotfiles.git ~/dotfiles`
2. `stow .`

### dependencies

- git
- stow

## Starship.rs - Cross-Platform shell | notes

### Configure

1. install starship: https://starship.rs/

2.✅ copy starship.toml to ~/.config/starship.toml

3. reload starship

## `tmux` - terminal multiplexer

### Steps to set up

1. Install [tpm](https://github.com/tmux-plugins/tpm):

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Run `mv tmux/.tmux.conf ~/` from the repository's root;
3. Run `tmux` and press `C-a + I` (capital I, after keys rebound) to install plugins;

### Useful `tmux` repositories

- https://github.com/christoomey/vim-tmux-navigator#restoring-clear-screen-key-binding

## Completed ✅

- tmux
- git
- zsh
- nvim
- brew

## In Progress ⏳

- starship

## Todo 📋

- (OSX - UI Settings)[https://dev.to/miguelcrespo/how-to-automate-software-installation-and-configuration-on-macos-using-homebrew-and-stow-4d8l]
- (OSX - App Store[https://dev.to/miguelcrespo/how-to-automate-software-installation-and-configuration-on-macos-using-homebrew-and-stow-4d8l]
- **lazy loading for autocompletion of certain CLI applications (if possible)**
- implement better dotenv files separation for .zshrc
- git
- ssh

