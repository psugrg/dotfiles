#!/bin/sh

# Install dependencies
sudo apt-get update && sudo apt-get install -y \
  fzf \
  npm \
  python3 \
  python3-pip \
  python3-venv \
  ranger \
  tmux \
  wget \
  zsh \
  zsh-autosuggestions \
  zsh-common \
  zsh-syntax-highlighting

# Install Deno (needed by neo-vim markdown-preview plugin)
curl -fsSL https://deno.land/install.sh | sh

# Install lazy-git
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Install Starship prompt
# First, create a folder required by starship
sudo mkdir -p /usr/local/bin
# and then, install Starship using
sudo curl -sS https://starship.rs/install.sh | sh -s -- -y

# Nerd Fonts to be installed
# https://www.nerdfonts.com/font-downloads
NERD_FONTS="CascadiaMono"
NERD_FONTS_VER=v3.3.0

# Download fonts
for FONT in $NERD_FONTS
do
  wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_VER/$FONT.zip
  sudo unzip /tmp/$FONT.zip -d /usr/share/fonts/truetype/$FONT
done

# Install fonts
sudo fc-cache -fv

# Install tmux-plugin-manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Change shell to ZSH
sudo chsh -s /bin/zsh $USER

echo 
echo 
echo Reboot your machine to finish configuration process!
