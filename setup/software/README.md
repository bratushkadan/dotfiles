# Software

## Configure

### Kubernetes

Copy over the `$HOME/.kube/config` file.

### ssh

Copy over the `$HOME/.ssh/` files.

Most notably:
```bash
~/.ssh
~/.ssh/id_rsa
~/.ssh/id_rsa.pub
~/.ssh/known_hosts
```

Once copied, change the permissions:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/known_hosts
```

### Yandex Cloud CLI (`yc`)

Setup zsh completion:
```bash
mkdir -p "/Users/${USER}/yandex-cloud"
cat >"/Users/${USER}/yandex-cloud/path.bash.inc" <<EOF
cli_dir="\$(cd "\$(dirname "\${(%):-%N}")" && pwd)"
bin_path="\${cli_dir}/bin"
export PATH="\${bin_path}:\${PATH}"
EOF
yc completion zsh > "/Users/${USER}/yandex-cloud/completion.zsh.inc"
```

### Firefox

Turn on Firefox Account synchronization first.

Copy extensions data:
1. Type `about:support` in the search field on the old device.
2. Find "Profile folder" > "Show in Finder" (MacOS) or "Open folder in system" (or something similar in Linux).
3. Transfer the following files to the new device:
```
addons.json
extensions.json
extension-preferences.json
extension-settings.json
prefs.js
```
4. Same as step `1.`, but for the new device.
5. Same as step `2.`, but for the new device.
6. Copy (override) the files from the old device to the profile folder of the new device.

Transfer Tampermonkey scripts:
1. In the old browser, go to Tampermonkey settings, **Dashboard** -> **Utilities** -> **Archive > Export**.
2. Import the archive on the device.

My settings include some such as `*telemetry*: false` in `about:config`>

### Obsidian

**NOTE: ALWAYS backup both the primary Vault and the version of Vault synced to cloud before the following operations**.

1. Create local backup.
2. Create cloud backup.
3. Place a backup to the new device (local > cloud). Copy Vault data to `"~/Obsidian/${USER}"`. (This data should be identical to the data synced by the [remotely saved plugin](https://github.com/remotely-save/remotely-save) plugin with the default settings, i.e. "cloud backup" created from data synced by the `remotely-save` plugin should be a 99.9999% match for "local backup").
4. Open this folder as a Vault on the new device.
5. Force `remotely-save` sync. If Vault directory is a directory created from a local backup, full sync with the remote source **will not be required**.

### Draw.io

Add custom icons.
**TODO:**


## Other

### Anki

Anki MacOS directory is `"${HOME}/Library/Application Support/Anki2/"`.

#### Addon List
- Advanced Browser
- Anki Simulator
- BetterSearch
- Convert Subdecks to Tag Hierarchy
- Highlight Search Results in the Browser
- Postpone cards review
- Review Heatmap

