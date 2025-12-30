#!/usr/bin/env zsh

local flag_help
local arg_role
local role
local usage=(
  "Usage:"
  "-h or --help - display this message. Optional"
  "-r or --role - role this computer is for <home|work>. Required"
  "setup [-h|--help]"
  "setup [-r|--role=<home|work>]"
)
# zparseopts
# Resources:
# - man zshmodules 
# - https://gist.github.com/mattmc3/804a8111c4feba7d95b6d7b984f12a53
zmodload zsh/zutil
zparseopts -D -E -F -- \
  {h,-help}=flag_help \
  {r,-role}:=arg_role ||
  return 1

# If $flag_help is not null or empty, print usage and exit
[[ -z "$flag_help" ]] || { print -l $usage && return }

# If $arg_role is not equal to home or work print error and display usage
case $arg_role[-1] in
  home)
    role="home"
    ;;
  work)
    role="work"
    ;;
  *) # Default case
    print -l "ERROR: -r or --role is empty or invalid" '' $usage
    return
    ;;
esac

# Create array of kegs or casks to install with Homebrew
# kegs and casks shared between home and work roles
shared_kegs=('zsh' 'bash' 'coreutils' 'tree' 'stow' 'git' 'mise' 'npm' 'tree-sitter-cli' 'docker' 'docker-compose' 'colima' 'lynx')
shared_casks=('font-jetbrains-mono-nerd-font' 'ghostty' 'todoist-app' 'obsidian')
# kegs and casks only installed for the home role
home_kegs=()
home_casks=('arc' '1Password' 'slack' 'sync')
# kegs and casks only installed for the work role
work_kegs=()
work_casks=('bruno')

if [[ "$role" == 'home' ]]; then
    # combine the shared and role arrays into a single kegs and casks array
    kegs=("${shared_kegs[@]}" "${home_kegs[@]}")
    casks=("${shared_casks[@]}" "${home_casks[@]}")
else
    kegs=("${shared_kegs[@]}" "${work_kegs[@]}")
    casks=("${shared_casks[@]}" "${work_casks[@]}")
fi

# Run brew install on every value in the kegs array.
echo "---------------------------------------------------------------------------"
echo "Installing brew kegs"
echo "---------------------------------------------------------------------------"
for k in ${kegs}; do
    /opt/homebrew/bin/brew install $k
done

# Run brew install --cask on every value in the casks array.
echo "---------------------------------------------------------------------------"
echo "Installing brew casks"
echo "---------------------------------------------------------------------------"
for c in ${casks}; do
    /opt/homebrew/bin/brew install --cask $c
done
