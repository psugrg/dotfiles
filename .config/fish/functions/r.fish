# Function used to start Ranger file browser
#
# Usage is the same as for `ranger` since `r` is a special alias for it
#
function r --description 'Run Ranger file browser'
  /usr/bin/ranger $argv
end
