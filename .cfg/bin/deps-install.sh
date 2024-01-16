#!/bin/sh

# Install dependencies
sudo apt-get update && \
  sudo apt-get install -y \
  ranger \
  wget \
  zsh \
  zsh-autosuggestions \
  zsh-common \
  zsh-syntax-highlighting

# Install Starship prompt
# First, create a folder required by starship
sudo mkdir -p /usr/local/bin
# and then, install Starship using
sudo curl -sS https://starship.rs/install.sh | sh -s -- -y

# Nerd Fonts to be installed
# https://www.nerdfonts.com/font-downloads
NERD_FONTS="SourceCodePro SpaceMono CascadiaCode CascadiaMono"
NERD_FONTS_VER=v3.1.1

# Download fonts
for FONT in $NERD_FONTS
do
  wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_VER/$FONT.zip
  sudo unzip /tmp/$FONT.zip -d /usr/share/fonts/truetype/$FONT
done

# Install fonts
sudo fc-cache -fv

# Change shell to ZSH
sudo chsh -s /bin/zsh $USER

echo 
echo 
echo Reboot your machine to finish configuration process!
