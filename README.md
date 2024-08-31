# dotfiles 
## Inital Setup
- Install [Homebrew](https://docs.brew.sh/Installation#macos-requirements)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
- Clone the dawilliams/dotfiles repo to your home directory
```bash
cd ~
git clone https://github.com/dawilliams/dotfiles
```
- Run the install.sh script
```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```
- Run the sync.sh script
```bash
cd ~/dotfiles
chmod +x sync.sh
./sync.sh
```
- Follow the [1Password CLI/App Integration](https://developer.1password.com/docs/cli/app-integration) instructions
- Follow the [1Password for SSH & Git](https://developer.1password.com/docs/ssh) instructions

## What's installed
- [zsh](https://www.zsh.org) via Homebrew
- [devbox](https://www.jetify.com/devbox/docs) via curl
- [rectange](https://rectangleapp.com) via Homebrew
- [1password](https://1password.com) via HomeBrew
- [1password-cli](https://1password.com/downloads/command-line) via Devbox global 
- [git](https://git-scm.com/) via Devbox global 
- [starship prompt](https://starship.rs) via Devbox global
- [neovim](https://neovim.io) via Devbox global
- [ripgrep](https://github.com/BurntSushi/ripgrep) via Devbox global

## Notes
- Devbox or Nix packages can be found on [Nixhub](https://www.nixhub.io)
- The RectangleConfig.json can be imported via the Rectangle app.
