# Setup MacOS

## Settings

### 1. Set programatically

```zsh
./set-default-settings
```

Reboot the system

### 2. Set manually

#### Settings > Displays

##### Automatically adjust brightness -> `Off`

##### Night Shift

- Schedule > Custom
- From 19:30 to 06:00
- Color temperature -> `More warm`

#### Settings > Lock Screen > Turn Display off on battery when inactive -> `For 5 minutes`

#### Settings > Keyboard > Turn keyboard backlight off after inactivity -> `after 10 seconds`

## Software

### Requirements

Sign in to your Apple ID account.

NOTE(\#1): Mac App Store apps (from `mas` sections inside Brewfile) will not be loaded/installed unless you're signed in to your Apple ID account.

### Install

First things first, install:
1. Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Activate the shell:
```bash
eval $(/opt/homebrew/bin/brew shellenv)
```

NOTE(\#2): (brew will be accessible via `brew` PATH-variable after running `stow .` that will symlink the `.zprofile` file that includes brew activation).

2. Run the command:

```bash
brew bundle
```

NOTE(\#3): `vagrant` and `vagrant-vmware-utility` casks installation will fail unless VPN is turned on.

If VSCode extensions installation fails, install only the VSCode extensions:

```bash
cat Brewfile | grep ^vscode | brew bundle --file=-
```

3. [Install fonts](../README.md#install-fonts).

4. Copy the config files: run the `stow` command from the [dotfiles arrangement](../../README.md#dotfiles-arrangement) section instructions.

**Note**: first zsh launch will be unsuccessful, the error will look similarly to `stat /Users/$USER/.zcompdump: stat: No such file or directory`.

### Manual install (Secondary)

#### Install via tools

Install Terraform:
```bash
tfenv install 1.4.1
tfenv use 1.4.1
```

#### Install via DMGs

- Obsidian
- Yandex Music
- Giphy Capture

---

Situational:
- UTM - open source virtualization tool with UI
- Time Out (Mac App Store) - tool for enabling periodical auto breaks from the screen to help eyes get rest

### Configure Software

#### Draw.io

Add custom icons.
**TODO:**

## Directory Structure & Finder Bookmarks

## Tips & Tricks

### Brew & Brewfile

*Brewfile* is a collection of casks/formulas/taps needed to set up the system for user's demands.

`brew bundle dump -f` writes current system's brew state into a file, `brew bundle -v` installs the dependencies listed in the *Brewfile*.

cp ./fonts/nerd/UbuntuMonoNerdFont-Regular.ttf /usr/local/share/fonts/

### `mas` – CLI for Mac App Store

List installed Mac App Store Apps:
```bash
mas list
```

Get Mac App Store installed applications without `mas` CLI tool installed (run from the dotfiles repository root):
```bash
cat Brewfile | grep ^mas
```
