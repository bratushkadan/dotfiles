# Ubuntu

## Yandex.Disk sync in Ubuntu
`yandex-disk.sh`:

```sh
#!/bin/bash
yandex-disk start --dir=~/disk && yandex-disk sync --dir=~/disk
```

## Fix dock icons in Ubuntu
`gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-show-previews'`

## Fix Anki installation in Ubuntu in case it's broken
`sudo apt-get install --reinstall libxcb-xinerama0`

