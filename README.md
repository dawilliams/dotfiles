# dotfiles

## Initial Setup
- Install [1Password](https://1password.com/downloads/mac/)
- Install [homebrew](https://brew.sh)
- Clone this repo
- Run brew bundle in this repo
- Run make in this repo
- Add Homebrew bash to /etc/shells `sudo sh -c 'echo /usr/local/bin/bash >> /etc/shells'`
- Set Homebrew bash as default shell `chsh -s /usr/local/bin/bash`
- Add AWS `credentials` and `config` files
- Add kube `config` file
- Copy `terraformrc\_template` to `~/.terraformrc` and update the token
- Add export `ATLAS\_TOKEN` in `bash\_profile`
- Restart kitty

## Notes
- Log into github using a Personal Access Token instead of your password.
