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

#### Plugins

Describe here the plugin update/installation process.

#### Telescope plugin

`brew install ripgrep` - DO NOT install `fd` simultaneously with `rg`, precedence seems to be `fd` > `rg`, Telescope bugs out and `pickers.find_files.hidden = true` option no longer shows hidden files/directories :(
Upd Jan 29, 2025 - no longer relevant, but be cautious.

### `tmux` - terminal multiplexer

#### Steps to set up

1. (✅ installed automatically via brew) Install [tpm](https://github.com/tmux-plugins/tpm):

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. (✅ configuration is symlinked via Stow) Run `mv .tmux.conf ~/` from the repository's root;
3. Run `tmux` and press `C-a + I` (capital I, after keys rebound) to install plugins;

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

