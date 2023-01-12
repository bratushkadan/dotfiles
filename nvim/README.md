# Neovim

## Install

```sh
sudo apt-get install neovim
```

or 

```sh
sudo add-apt-repository ppa:neovim-ppa/stable 
sudo apt-get install neovim
```

## Configure

1. `mkdir -p ~/.config/nvim`
2. Careful! This command will overwrite the existing nvim configs: `cp -Rf /configs/* ~/.config/nvim`
3. `cp .vimrc ~/`
4. add `export VIMCONFIG=~/.config.nvim` to `.bashrc` or `.zshrc`

## Plugins

### `fzf` - fuzzy finder

1. `cd $VIMCONFIG/pack/bundle/start`
2. `git clone https://github.com/junegunn/fzf`
3. `$VIMCONFIG/pack/bundle/start/fzf/install --bin`
4. add `export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin` to `.bashrc` or `.zshrc` file

use command `:FZF` in vim

## Options

- enabled python provider: `pip3 install --user --upgrade neovim` (then run the command `:py3 print('hello')`)
