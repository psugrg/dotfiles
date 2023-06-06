# Dotfile repository

This repository follows the rules described at <https://www.atlassian.com/git/tutorials/dotfiles>

## Installation on a new machine

### Config files installation

```sh
curl -Lks https://raw.githubusercontent.com/psugrg/dotfiles/master/.cfg/bin/cfg-install | /bin/sh
```

To change the default link to repo (i.e. to be able to checkout via ssh), use:

```sh
curl -Lks https://raw.githubusercontent.com/psugrg/dotfiles/master/.cfg/bin/cfg-install | /bin/sh -s -- git@github.com:psugrg/dotfiles.git
```

### Dependencies

#### Ubuntu

```sh
curl -Lks https://raw.githubusercontent.com/psugrg/dotfiles/master/.cfg/bin/deps-install.sh | /bin/sh
```
