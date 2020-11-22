#
# Function used to automatically add changes in configuration
#
function config-add --description 'Auto add configuration changes'
  # Prepare the list of files/folders for addition
  set LIST  "$HOME/.config/fish/functions/*" \
            "$HOME/.config/ranger/*" \
            "$HOME/.config/regolith/Xresources" \
            "$HOME/.config/nvim/init.vim" \
            "$HOME/.config/nvim/general/*" \
            "$HOME/.config/nvim/plug-config/*" \
            "$HOME/.config/nvim/themes/*" \
            "$HOME/.config/nvim/vim-plug/*" \
            "$HOME/.config/nvim/keys/*" \

  echo "Adding files to the configuration repository"
  config add -v $LIST

  echo ""
  echo "Status after addition"
  config status
end
