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


### Draw.io

Add custom icons.
**TODO:**


## Other

- [Anki](./anki.md)
