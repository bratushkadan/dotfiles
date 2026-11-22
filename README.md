# bratushkadan's dotfiles

## Dotfiles Arrangement

GNU Stow links configuration files from the checkout into `$HOME`.

```sh
git clone git@github.com:bratushkadan/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

On macOS, the [base Homebrew profile](#homebrew-profiles) includes
Stow. From the repository root, preview and install the base package.

```sh
stow -n -v -d ./stow -t "$HOME" --no-folding base
stow       -d ./stow -t "$HOME" --no-folding base
```

Add either or both optional packages as needed.

```sh
stow -d ./stow -t "$HOME" --no-folding personal
stow -d ./stow -t "$HOME" --no-folding work
```

| Package | Managed files |
| --- | --- |
| `base` | zsh, Git, tmux, Starship, Neovim, Codex notification hooks, and the Brewfile skill |
| `personal` | Alacritty and personal Codex rules |
| `work` | Terraform, OpenTofu, yamllint, and work Codex rules |

Each package under `stow/` mirrors its paths in `$HOME`. Use
`--no-folding` so Stow creates links to individual files inside directories
like `~/.codex` and `~/.agents`. When updating an existing checkout from
the old `stow .` layout, replace the old links before installing the new
packages and preserve local files in linked directories.
[GNU Stow options](https://www.gnu.org/software/stow/manual/html_node/Invoking-Stow.html)

## macOS setup

### Homebrew profiles

From the repository root, install the base profile and add the personal or work
profile as needed. A machine can use both additions.

| Profile | Contents |
| --- | --- |
| [`base`](brew/base.Brewfile) | Git, Stow, Neovim, tmux, and shell tools |
| [`personal`](brew/personal.Brewfile) | Desktop apps and personal utilities, including Alacritty, Anki, and TickTick |
| [`work`](brew/work.Brewfile) | Development tools, Kubernetes, Yandex Arc, and coding agents |

```sh
brew bundle install --no-upgrade --file=brew/base.Brewfile
```

The root [`Brewfile`](Brewfile) is the full package inventory. The
[macOS setup guide](./setup/macos/README.md#install) has the optional install
commands and prerequisites. Select the [zsh profile](#zsh) separately.

## Tools

### Zsh

`.zshrc` loads the modules under [`.config/zsh/`](stow/base/.config/zsh) in a fixed
order. Every profile loads the shared modules, `~/.env`, and
`~/.env_common`.

| `DOTFILES_PROFILE` | Optional modules |
| --- | --- |
| `base` | Shared modules only |
| `personal` | Anki helpers |
| `work` | Kubernetes, Terraform, and Yandex Cloud helpers. Also loads `~/.zshrc_work` when present |
| `all` (default) | Both optional profiles |

Set the default in your local `~/.env_common`. This example defaults to
`work` while allowing `DOTFILES_PROFILE=base zsh` for a single launch.

```sh
DOTFILES_PROFILE=${DOTFILES_PROFILE:-work}
```

### DeepSeek Harness (dsh)

#### Setup

The dsh setup uses the checkout's `.dsh/` directory. On a fresh machine,
if `~/.dsh` is absent, link it from the repository root with
`ln -s "$PWD/.dsh" "$HOME/.dsh"`.

Run the renderer from the repository root. It uses `envsubst` to create
YAML files next to the templates in `.dsh/presets/`.

```bash
./scripts/render-presets.sh
```

Integrate with OpenCode Console: https://opencode.ai/console/integrations/deepseek-harness

### nvim

Neovim uses [AstroNvim](https://docs.astronvim.com/) v6. After installing the `base` Stow package, launch `nvim` to install the plugins automatically.

See [the Neovim configuration README](stow/base/.config/nvim/README.md) for requirements, commands, and customization.

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
2. [Link the dotfiles](#dotfiles-arrangement) to install `~/.tmux.conf`.
3. Run `tmux` and press `C-a + I` (capital I) to install plugins.

#### Useful `tmux` repositories

- https://github.com/christoomey/vim-tmux-navigator#restoring-clear-screen-key-binding


## Roadmap

### DeepSeek Harness layout

For dsh, the proposed layout keeps source templates in `tools/dsh/` and
renders the active profiles into `~/.dsh/`.

### Tools to revisit

- Consider chezmoi when machines need different contents for shared files,
  such as Git identity or agent settings. A local role can drive file
  templates and choose which files to install.
  [Machine-specific configuration](https://www.chezmoi.io/user-guide/manage-machine-to-machine-differences/)
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
