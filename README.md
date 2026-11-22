# bratushkadan's dotfiles

## Dotfiles Arrangement

Chezmoi manages the files in your home directory. The checkout lives at
`~/.local/share/chezmoi`, and `.chezmoiroot` selects `home/` as the source
state. On macOS, install chezmoi with `brew install chezmoi`.

On a fresh machine, check out the chezmoi branch and preview the changes.

```sh
chezmoi init --branch v2 git@github.com:bratushkadan/dotfiles.git
chezmoi diff
chezmoi apply
```

During init, choose whether to enable work configuration and personal shell
helpers, and select the Alacritty theme. Edit
`~/.config/chezmoi/chezmoi.toml` to change those choices later. Work mode
selects the work Terraform configuration and includes OpenTofu, yamllint,
and work Codex rules. When you turn off work mode on an existing machine,
chezmoi skips those optional paths on future runs. Move any previously
installed work files aside if you also want them out of your home directory.

The default symlink mode keeps plain files such as Neovim's lockfile linked
to the checkout. For generated configs, use `chezmoi edit --apply <path>`
to edit the source and apply the rendered result.

## macOS setup

### Homebrew profiles

From the repository root, install the base profile and add the personal or work
profile as needed. A machine can use both additions.

| Profile | Contents |
| --- | --- |
| [`base`](brew/base.Brewfile) | Git, chezmoi, Neovim, tmux, and shell tools |
| [`personal`](brew/personal.Brewfile) | Desktop apps and personal utilities, including Alacritty, Anki, and TickTick |
| [`work`](brew/work.Brewfile) | Development tools, Kubernetes, Yandex Arc, and coding agents |

```sh
brew bundle install --no-upgrade --file=brew/base.Brewfile
```

The root [`Brewfile`](Brewfile) is the full package inventory. The
[macOS setup guide](./setup/macos/README.md#install) has the optional install
commands and prerequisites. Run bundle commands from `~/.local/share/chezmoi`.

## Tools

### Zsh

`.zshrc` loads the modules under [`.config/zsh/`](home/private_dot_config/zsh) in a fixed
order. Every profile loads the shared modules, `~/.env`, and
`~/.env_common`.

| `DOTFILES_PROFILE` | Optional modules |
| --- | --- |
| `base` | Shared modules only |
| `personal` | Anki helpers |
| `work` | Kubernetes, Terraform, and Yandex Cloud helpers. Also loads `~/.zshrc_work` when present |
| `all` | Both optional profiles |

Chezmoi sets the default from the machine's `work` and `personal` choices.
Override it for one launch with `DOTFILES_PROFILE=base zsh`, or set it in
your local `~/.env_common` to choose a different default at shell startup.

```sh
DOTFILES_PROFILE=${DOTFILES_PROFILE:-work}
```

### DeepSeek Harness (dsh)

#### Setup

Chezmoi installs the tracked presets and web profile files in `~/.dsh/`
and renders the preset paths for the current home directory. Shell helpers
use those installed presets. On macOS the web preset's `node_modules` link
uses the standard Apple Silicon or Intel Homebrew prefix. Install dsh
separately. Keep authorization, sessions, installed plugins, and personal
overrides in the local dsh directory.

Integrate with OpenCode Console: https://opencode.ai/console/integrations/deepseek-harness

### nvim

Neovim uses [AstroNvim](https://docs.astronvim.com/) v6. After running `chezmoi apply`, launch `nvim` to install the plugins automatically.

See [the Neovim configuration README](home/private_dot_config/nvim/README.md) for requirements, commands, and customization.

#### Key mappings

The leader key is Space. Standard Vim commands still work. The old custom mappings were removed during the migration; some AstroNvim defaults use the same keys.

| Shortcut | Current behavior | Migration note |
| --- | --- | --- |
| `Space ff` | Find files | Same purpose as before |
| `Space fb` | Find buffers | Same purpose as before |
| `Space fh` | Find help | Same purpose as before |
| `Space db` | Toggle a breakpoint | Same purpose as before |
| `Space e` | Toggle the file explorer | Previously revealed the current file |
| `Space o` | Switch focus between the explorer and editor | Previously focused a floating explorer |
| `Space fg` | Find Git files | Previously searched file contents; use `Space fw` now |
| `Space fs` | Search buffers, recent files, and files | Previously opened text search with arguments |
| `Space fw` | Search file contents | AstroNvim text search |
| `Space fk` | Find key mappings | Browse the current shortcuts |

Old Harpoon bindings, custom Bufferline commands, and custom Go shortcuts were removed with the previous configuration. Press Space and wait to see available mappings in the which-key popup.

### `tmux`

Terminal multiplexer.

#### Steps to set up

1. Install the [base Homebrew profile](#homebrew-profiles) for tmux and
   [`tpm`](https://github.com/tmux-plugins/tpm).
2. [Apply the dotfiles](#dotfiles-arrangement) to install `~/.tmux.conf`.
3. Run `tmux` and press `C-a + I` (capital I) to install plugins.

#### Useful `tmux` repositories

- https://github.com/christoomey/vim-tmux-navigator#restoring-clear-screen-key-binding


## Roadmap

### Tools to revisit

- Consider Rulesync for sharing one set of instructions across Codex, Claude
  Code, OpenCode, and dsh. A project-level trial can start with Markdown rules
  and `generate --dry-run`. Codex `.rules` files use the separate
  permissions feature. For dsh, Rulesync manages MCP in the global
  `~/.dsh/cordis.patch.yml` layer.
  [Supported features](https://rulesync.dyoshikawa.com/reference/supported-tools) · [dsh file format](https://rulesync.dyoshikawa.com/reference/file-formats)

## In Progress ⏳

## Todo 📋

- (OSX - UI Settings)[https://dev.to/miguelcrespo/how-to-automate-software-installation-and-configuration-on-macos-using-homebrew-and-stow-4d8l]
- (OSX - App Store[https://dev.to/miguelcrespo/how-to-automate-software-installation-and-configuration-on-macos-using-homebrew-and-stow-4d8l]
- ⚡️ **lazy loading for autocompletion of certain CLI applications (if possible)**
- implement better dotenv files separation for .zshrc
- git
- ssh
- starship
