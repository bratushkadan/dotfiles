# Setup MacOS

## Settings

### 1. Set programatically

Apply settings [from the file](./my-default-settings.bash).

Then reboot the system

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

### Manual install (Critical)

First things first, install:
1. Brew

### Install from the configuration

Install from Brewfile.

### Manual install (Secondary)

- Obsidian
- Elpy - Nature Sounds Mixer 🌿🍃
- Yandex Music
- Toggl Track
- TickTick
- Money Flow
- Giphy Capture

---

Situational:
- UTM - open source virtualization tool with UI

### Configure Software

#### Draw.io

Add custom icons.
**TODO:**

## Tips & Tricks

### Brew & Brewfile

*Brewfile* is a collection of casks/formulas/taps needed to set up the system for user's demands.

`brew bundle dump -f` writes current system's brew state into a file, `brew bundle -v` installs the dependencies listed in the *Brewfile*.

cp ./fonts/nerd/UbuntuMonoNerdFont-Regular.ttf /usr/local/share/fonts/
