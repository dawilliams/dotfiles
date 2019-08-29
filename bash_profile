# Source bashrc if it exists
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export PATH=$PATH:$HOME/go/bin
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
