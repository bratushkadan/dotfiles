# Neovim / AstroNvim

This configuration uses [AstroNvim](https://docs.astronvim.com/) v6 through lazy.nvim, based on the [official template](https://github.com/AstroNvim/template).

## Setup

Run `stow .` from the dotfiles repository, then start `nvim`. The existing `~/.config/nvim` symlink points here; do not clone the template over it.

Requirements: Neovim 0.11+, Git, a C compiler, and a Nerd Font configured in the terminal. On macOS, install the compiler with `xcode-select --install` if needed. The Brewfile includes Neovim and ripgrep for searching. Mason installs the Tree-sitter CLI automatically.

LuaRocks support in lazy.nvim is disabled because this configuration does not use plugins that require it. Language servers, formatters, and debuggers are installed as needed instead of installing the old tool list automatically.

## Commands

- `:Lazy` — manage plugins; `:Lazy sync` — update plugins and remove unused ones.
- `:AstroUpdate` — update AstroNvim plugins and Mason packages.
- `:Mason` — manage external tools.
- `:LspInstall pyright` — install a language server (replace `pyright` as needed).
- `:TSInstall python` — install a syntax parser.
- `:DapInstall python` — install a debugger.
- `:checkhealth` — check the installation.

The leader key is Space. See the [default mappings](https://docs.astronvim.com/mappings/).

## Customization

`init.lua` bootstraps lazy.nvim; `lua/lazy_setup.lua` selects AstroNvim v6 and configures the plugin manager. Add plugin specs under `lua/plugins/`. `lua/plugins/astrocore.lua` preserves four-space indentation and eight lines of scroll context; other settings use AstroNvim defaults.

`lazy-lock.json` records installed plugin versions and should be committed after intentional updates.

When migrating from another configuration, close Neovim and move its data, state, and cache directories to backups before the first launch, as described in the [installation guide](https://docs.astronvim.com/). Keep the config symlink in place. Old Mason packages and plugins remain in those backups until you choose to remove them.

## Health check note

With the pinned Tree-sitter version on Neovim 0.11, `:checkhealth nvim-treesitter` can report that the parser directory is missing from runtimepath because it compares paths with different trailing slashes. The normalized path matches, and opening and parsing a Lua file was verified successfully.
