#!/bin/sh

# Install dependencies
sudo apt-get update && \
  sudo apt-get upgrade -y && \
  sudo apt-get install -y \
  ranger \
  wget \
  zsh \
  zsh-autosuggestions \
  zsh-common \
  zsh-syntax-highlighting

# Install Starship prompt
sudo curl -sS https://starship.rs/install.sh | sh -s -- -y

# Nerd Fonts to be installed
# https://www.nerdfonts.com/font-downloads
NERD_FONTS="SourceCodePro SpaceMono"
NERD_FONTS_VER=v2.1.0

# Download fonts
for FONT in $NERD_FONTS
do
  wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_VER/$FONT.zip
  sudo unzip /tmp/$FONT.zip -d /usr/share/fonts/truetype/$FONT
done

# Install fonts
sudo fc-cache -fv
