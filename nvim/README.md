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

## Options

- enabled python provider: `pip3 install --user --upgrade neovim` (then run the command `:py3 print('hello')`)
