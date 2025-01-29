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

### Draw.io

Add custom icons.
**TODO:**


## Other

- [Anki](./anki.md)
