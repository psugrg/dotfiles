#!/bin/sh

# Install dependencies
sudo apt-get update && sudo apt-get install -y \
  npm \
  python3 \
  python3-pip \
  python3-venv \
  wget \
  zsh \
  zsh-autosuggestions \
  zsh-common \
  zsh-syntax-highlighting

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

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Install tmux
TMUX_VER=3.6a
curl -LO https://github.com/tmux/tmux-builds/releases/download/3.5a/tmux-$TMUX_VER-linux-x86_64.tar.gz
tar -xzf tmux-$TMUX_VER-linux-x86_64.tar.gz
sudo mv tmux /usr/local/bin
rm tmux-$TMUX_VER-linux-x86_64.tar.gz

# Install tmux-plugin-manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install herdr terminal multiplexer (new tmux)
# NOTE: This will probably replace the tmux in the near future (in this configuration)

curl -fsSL https://herdr.dev/install.sh | sh

# Change shell to ZSH
sudo chsh -s /bin/zsh $USER

echo 
echo 
echo Reboot your machine to finish configuration process!
