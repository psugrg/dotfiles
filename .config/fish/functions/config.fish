# Function used to manage dotfiles
#
# Usage is the same as for git since config is a special alias for it
#
function config --description 'Manage dotfiles'
  /usr/bin/git --git-dir=/home/p/.cfg/ --work-tree=/home/p $argv
end
