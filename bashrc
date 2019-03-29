### Install
# 1. Install latest bash via brew: brew install bash
# 2. Add the new bash version to /etc/shells (https://johndjameson.com/blog/updating-your-shell-with-homebrew/) 
###############

# Source other files

# Get it from the original Git repo:
# Clone the alacritty repo and follow the instructions for macOS
# https://raw.githubusercontent.com/jwilm/alacritty/v0.2.9/alacritty-completions.bash
if [ -f ~/alacritty-completions.bash ]; then
  source ~/alacritty-completions.bash
fi

