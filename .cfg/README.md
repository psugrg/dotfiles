# Dotfile repository

## It follows the rules described:
https://www.atlassian.com/git/tutorials/dotfiles
	
## Installation on a new machine: 
```
curl -Lks https://raw.githubusercontent.com/psugrg/dotfiles/master/.cfg/bin/cfg-install | /bin/bash
```

To change the default link to repo (i.e. to be able to checkout via ssh), use:
```
curl -Lks https://raw.githubusercontent.com/psugrg/dotfiles/master/.cfg/bin/cfg-install | /bin/bash -s git@github.com:psugrg/dotfiles.git
```
