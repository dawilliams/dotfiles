# dotfiles 
## Inital Setup
- Install [Homebrew](https://docs.brew.sh/Installation#macos-requirements)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
- Clone the dawilliams/dotfiles repo to your home directory
```bash
cd ~
git clone --recursive https://github.com/dawilliams/dotfiles
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
### Homebrew
- [zsh](https://www.zsh.org)
- [wezterm](https://wezfurlong.org/wezterm/index.html)
- [rectange](https://rectangleapp.com)
- [1password](https://1password.com)
- [todoist](https://todoist.com/downloads)
- [sync](https://www.sync.com)

### Curl
- [devbox](https://www.jetify.com/devbox/docs)

### Devbox Global
- [1password-cli](https://1password.com/downloads/command-line)
- [git](https://git-scm.com/)
- [starship prompt](https://starship.rs)
- [neovim](https://neovim.io)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

### Git Submodule
- [kickstart-modular.nvim](https://github.com/dawilliams/kickstart-modular.nvim/tree/master)

## Notes
- The RectangleConfig.json can be imported via the Rectangle app.

## FAQs
**Q: How do I search for a Devbox package?**\
**A:** `devbox search {package}` or search on [Nixhub](https://www.nixhub.io)

**Q: How do I add a Devbox package to every environment on the machine? i.e. globally**\
 **A:** `devbox global add {package}@{version}` where the `@{version}` is optional but recommended.
