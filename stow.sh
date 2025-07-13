#!/usr/bin/env zsh

local flag_help
local arg_action
local arg_role
local action
local role
local usage=(
  "Usage:"
  "-h or --help - display this message. Optional"
  "-a or --action - stow action to run <stow|delete|restow>. Required"
  "-r or --role - stow role to run <home|work>. Required"
  "stow.sh [-h|--help]"
  "stow.sh [-a|--action=<stow|delete|restow>]"
)
# zparseopts
# Resources:
# - man zshmodules 
# - https://gist.github.com/mattmc3/804a8111c4feba7d95b6d7b984f12a53
zmodload zsh/zutil
zparseopts -D -E -F -- \
  {h,-help}=flag_help \
  {a,-action}:=arg_action \
  {r,-role}:=arg_role ||
  return 1

# If $flag_help is not null or empty, print usage and exit
[[ -z "$flag_help" ]] || { print -l $usage && return }

# If $arg_action is not equal to stow, delete or restow print error and display usage
# else set action equal to stow, delete or restow
case $arg_action[-1] in
  stow)
    action="--stow"
    ;;
  delete)
    action="--delete"
    ;;
  restow)
    action="--restow"
    ;;
  *) # Default case
    print -l "ERROR: -a or --action is empty or invalid" '' $usage
    return
    ;;
esac

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

## Get directory of this script
## $0: This represents the path to the currently running script.
## :a: This flag forces the path to be absolute, resolving any relative paths or symbolic links to their canonical absolute form.
## :h: This flag extracts the "head" of the path, which corresponds to the directory containing the script.
local script_directory="${0:a:h}"
cd ${script_directory}

## List every directory in the current directory, removing the trailing '/'
for config_directory in $(ls -d */ | cut -f1 -d'/') 
do
  ## For every directory run stow to symlink config files to the users home directory.
  ## Check for a directory defined by the role variable. Currently either 'home' or 'work'
  ## If the role directory exists, symlink that directory otherwise symlink the parent directory
  if [[ -d "$config_directory/$role" ]]; then
     stow ${action} --dir ${script_directory}/${config_directory} --target ${HOME} ${role}
  else
     stow ${action} --dir ${script_directory} --target ${HOME} ${config_directory}
  fi
done
