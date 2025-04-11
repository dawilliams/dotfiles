# dotfiles 
## Inital Setup
> [!WARNING]  
> If restoring from a time machine backup, restart your computer before proceeding.

### Mac Config
- Setup Switch Workspaces Shortcut
Select Settings => keyboard => Keyboard shortcuts => Mission Control => Mission Control

- Install [Homebrew](https://docs.brew.sh/Installation#macos-requirements)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
- Clone the dawilliams/dotfiles repo to your home directory
```bash
cd ~
git clone https://github.com/dawilliams/dotfiles
```
- Run the setup.sh script
```bash
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```
- Run the stow.sh script
```bash
./stow.sh --action stow --role [home|work]
```
- Run the devbox global install command
```bash
devbox global install
```

- ??? Follow the [1Password CLI/App Integration](https://developer.1password.com/docs/cli/app-integration) instructions
- Follow the [1Password for SSH & Git](https://developer.1password.com/docs/ssh) instructions
- Follow the [download the public ssh key](https://developer.1password.com/docs/ssh/agent/advanced/#use-multiple-github-accounts) instruction in the Use multiple Github accounts section.
- Checkout obsidian vault to the Documents directory.


## What's installed
### Homebrew
- [zsh](https://www.zsh.org)
- [ghostty](https://https://ghostty.org/docs)
- [1password](https://1password.com)
- [todoist](https://todoist.com/downloads)
- [sync](https://www.sync.com)
- [obsidian](https://obsidian.md)

### Curl
- [devbox](https://www.jetify.com/devbox/docs)
- [docker-scout cli](https://github.com/docker/scout-cli)
- [mint](https://github.com/mintoolkit/mint?tab=readme-ov-file#scripted-install)

### Devbox Global
- [1password-cli](https://1password.com/downloads/command-line)
- [git](https://git-scm.com/)
- [starship prompt](https://starship.rs)
- [neovim](https://neovim.io)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [colima](https://github.com/abiosoft/colima)
- [docker](https://www.docker.com)
- [docker-desktop](https://docs.docker.com/compose/)

### softwareupdate CLI Command
- [rosetta](https://support.apple.com/en-us/102527) NOTE: I'm not sure I need this.

## Notes
- Set up default colima VM based on [this article](https://medium.com/@guillem.riera/the-most-performant-docker-setup-on-macos-apple-silicon-m1-m2-m3-for-x64-amd64-compatibility-da5100e2557d)
- [Google Sytle Guides](https://google.github.io/styleguide/)

## FAQs
### devbox
**Q: How do I search for a Devbox package?**\
**A:** Type the following or search on [Nixhub](https://www.nixhub.io)
```bash
devbox search {package}
``` 

**Q: How do I add a Devbox package to every environment on the machine? i.e. globally**\
 **A:** Type following where the `@{version}` is optional but recommended.

```bash
devbox global add {package}@{version}
``` 

**Q: How do I create a new devbox local environment?**\
 **A:** Type the following in the directory you want to create the environment.
```bash
devbox init
``` 

**Q: How do I add a Devbox package to a local environment?**\
 **A:** Type following where the `@{version}` is optional but recommended.
```bash
devbox add {package}@{version}
```

### github
**Q: How do I update a local git submodule with remote changes?**\
**A:** Type the following command in the repository directory
```bash
git submodule update --remote --merge
```

### zsh
**Q: How do I list defined functions?**\
**A:** Type the following in a terminal
```bash
print -l ${(ok)functions}
```

**Q: How do I show a function body?**\
**A:** Type the following in a terminal
```bash
functions {FUNCTION_NAME}
```
