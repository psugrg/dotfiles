# ZSH Configuration file
#
# Type `zinit status` in your terminal to get the status of the configuration.
#
# Deps:
# - fzf
#       sudo apt install fzf
#       brew install fzf

# Check deps
if ! fzf --version > /dev/null 2>&1; then
    echo Please install the required FZF package!
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light ajeetdsouza/zoxide

# Load completions
autoload -U compinit && compinit

# Replay all cached completions as mentioned in the documentation
zinit cdreplay -q

# Fix problem with ghostty
export TERM=xterm-256color

# KEY BINDINGS
# Use vi mode
bindkey -v
# HIST: History search next, prev
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
# HIST: Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward
# VIM: Fix backspace bug when switching modes
bindkey "^?" backward-delete-char
# VIM: Bind jk and kj as esc
bindkey jk vi-cmd-mode
bindkey kj vi-cmd-mode
# END KEY BINDINGS

# VIM MODE CONFIGURATION
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
# END VIM MODE CONFIGURATION

# HISTORY CONFIGURATION
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# END HISTORY CONFIGURATION

# AUTO COMPLETION CONFIGURATION
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' fzf-search-display true
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# END AUTO COMPLETION CONFIGURATION

# Dotfiles 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Commands aliases
alias ls='ls --color'
alias la='ls -al --color'

# Default editor: Neo-Vim
export EDITOR=nvim

# SHELL INTEGRATION CONFIGURATION
# Fuzzy Finding integration
eval "$(fzf --zsh)"
# END SHELL INTEGRATION CONFIGURATION

# Notes & Quick-Notes
export QNOTES_PATH=~/notes/quick-notes
alias qnote='~/notes/.bin/qnote.sh'
notes()
{
    cd ~/notes
    nvim .
}

# Load optional ssh aliases
source ~/.config/ssh_aliases.zsh 2>/dev/null

# Load optional non-versioned configuration
source ~/.zshrc_local.zsh 2>/dev/null

# Initialize Startship prompt
eval "$(starship init zsh)"
