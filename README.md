# bratushkadan's dotfiles

## Dotfiles Arrangement

Dotfiles are managed via GNU Stow – the "symlink farm manager". Its largest benefit is seamless integration with VCS that allows one to set it up once and reach **only** for the `git commit/push` command if there's a need to change configuration. That's it, once it's configured it just works.

Initializing symlinks is dead simple:

1. `git clone git@github.com:bratushkadan/dotfiles.git ~/dotfiles && cd ~/dotfiles`
2. `stow .`

### dependencies

- git
- stow (included in this repo's Brewfile)

## [MacOS / OSX](./setup/macos/README.md)

### [Brew / BrewFile](./setup/macos/README.md#brew--brewfile)

## Tools

### nvim

Neovim uses [AstroNvim](https://docs.astronvim.com/) v6. After `stow .`, launch `nvim` to install the plugins automatically.

See [the Neovim configuration README](.config/nvim/README.md) for requirements, commands, and customization.

### `tmux`

Terminal multiplexer.

#### Steps to set up

1. (✅ installed automatically via brew) install *tmux*;
2. (✅ installed automatically via brew) install [`tpm`](https://github.com/tmux-plugins/tpm):
3. (✅ configuration is symlinked via Stow) move from the repository root `.tmux.conf` to home directory: `mv .tmux.conf $HOME/`:
4. Run `tmux` and press `C-a + I` (capital I, after keys rebound) to install plugins;

#### Useful `tmux` repositories

- https://github.com/christoomey/vim-tmux-navigator#restoring-clear-screen-key-binding


## Roadmap

## In Progress ⏳

## Todo 📋

- (OSX - UI Settings)[https://dev.to/miguelcrespo/how-to-automate-software-installation-and-configuration-on-macos-using-homebrew-and-stow-4d8l]
- (OSX - App Store[https://dev.to/miguelcrespo/how-to-automate-software-installation-and-configuration-on-macos-using-homebrew-and-stow-4d8l]
- ⚡️ **lazy loading for autocompletion of certain CLI applications (if possible)**
- implement better dotenv files separation for .zshrc
- git
- ssh
- starship

