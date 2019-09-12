# Source bashrc if it exists
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
