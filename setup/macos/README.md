# Setup MacOS

The **very first thing to do** is install Brew and install packages from Brewfile!

## Settings

### 1. Set programatically

```zsh
./set-default-settings
```

Reboot the system

### 2. Set manually

#### Finder

1. Click on the toolbar (e.g., search icon).
1. Click "`Customize Toolbar...`".
1. Replace `View` option on the toolbar with the `Path` option in the Drag menu.

#### Settings > Desktop & Dock

##### Hot Corners...

Disable.

#### Settings > Keyboard

##### Text Input > Input Sources

1. Add the required layouts.
2. `> Russian and U.S. > Edit...` ->  Disable "Use smart quotes and dashes" 🚨

##### Keyboard Shortcuts... > Input Sources

1. Change the "`Select next source in Input menu`" to `^Space`;
1. Turn off the "`Select the previous input source`".

##### Keyboard Shortcuts... > Spotlight

1. Check off the "`Show Spotlight search`" option;
1. Check off the "`Show Finder search window`" option.

##### Keyboard Shortcuts... > Modifier Keys

1. Set "Caps Lock key" to "`No Action`" for my secondary (external) keyboard.

#### Settings > Sounds

##### Set Alert Sound to `Bubble`

#### Settings > Accessibility > Shortcut

**Uncheck** every option except the "`Color Filters`".

#### Settings > Notifications

##### Skotty > Off

##### Mail > Off for *Sounds*

#### Settings > Displays

##### Automatically adjust brightness -> `Off`

##### Night Shift

- Schedule > Custom
- From 19:30 to 05:30
- Color temperature -> `More warm`

#### Settings > Lock Screen > Turn Display off on battery when inactive -> `For 5 minutes`

#### Settings > Keyboard > Turn keyboard backlight off after inactivity -> `after 10 seconds`

## Software

### Requirements

Sign in to your Apple ID account.

Turn on iCloud sync to add device to the Apple ID account. In the iCloud section, turn on the "Sync Passwords" option.

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

#### Terraform

Install Terraform:
```bash
mkdir -p ~/.terraform.d/plugins
tfenv install 1.5.7
tfenv use 1.5.7
```

#### Install Vagrant

##### New: qemu provider

Source: [Vagrant Setup for macOS with Apple Chips](https://dev.to/flpcastro/vagrant-setup-for-macos-with-apple-chips-87p)

##### Old: vmware provider

[Vagrant for arm64 macs | Habr article](https://habr.com/ru/companies/bar/articles/708950/)

[VMWare license keys (for test purposes only)](https://gist.github.com/ezracb/de0f33ca55e340f43328467e6787b7a9)

```bash
wget https://download3.vmware.com/software/FUS-TP2023/VMware-Fusion-e.x.p-22068932_universal.dmg
```

##### Official Vagrant Boxes

[**Official Vagrant VM boxes for ARM64 qemu provider**](https://portal.cloud.hashicorp.com/vagrant/discover?architectures=arm64&providers=qemu)

[Official Vagrant VM boxes](https://portal.cloud.hashicorp.com/vagrant/discover?architectures=arm64&providers=vmware_desktop)

My favorite boxes:
- [perk/ubuntu-2204-arm64](https://portal.cloud.hashicorp.com/vagrant/discover/perk/ubuntu-2204-arm64) - for qemu
- [bento/ubuntu-24.04 - for vmware](https://portal.cloud.hashicorp.com/vagrant/discover/bento/ubuntu-24.04)

#### Install via DMGs

- Obsidian
- Yandex Music
- Giphy Capture: `mas search giphy` & `mas install <id>`

---

Situational:
- [BrainFM](https://www.brain.fm/download) – Science-backed Neuro-music
- UTM - open source virtualization tool with UI
- Time Out (Mac App Store) - tool for enabling periodical auto breaks from the screen to help eyes get rest
- Amethyst - Window/Tile Manager for MacOS
- Orbstack - fast containerization solution

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
