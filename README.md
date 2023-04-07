# dotfiles
## Git Bare Repository
This repository is intended to be pulled as a bare repositiry as described by [this article.](https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d)

### Installing This Config on a New System
To install and use this repository as your MacOS configuration, run 
* `xcode-select --install` to install Xcode command line tools
* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"` to install Homebrew
* `curl https://raw.githubusercontent.com/dawilliams/dotfiles/main/scripts/config-init | bash` to download and run the [config-init](scripts/config-init) file stored in this repository.
* `brew bundle` to install applications and utilities managed by Homebrew
* Add `/opt/homebrew/bin/zsh` to /etc/shells via sudo
* `chsh -s /opt/homebrew/bin/zsh` to make Homebrew zsh the default shell.

## What's installed
* [Xcode Command Line Tools](https://www.makeuseof.com/install-xcode-command-line-tools/) via `xcode-select --install`
* [Homebrew](https://docs.brew.sh/Installation#macos-requirements) via `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
* [zsh](https://www.zsh.org/) via `HomeBrew Brewfile`
* [asdf](https://asdf-vm) via `HomeBrew Brewfile`
* [1password](https://1password.com) via `HomeBrew Brewfile`
* [1password-cli](https://1password.com/downloads/command-line) via `HomeBrew Brewfile`
* [git](https://git-scm.com/) via `HomeBrew Brewfile`
* [github cli](https://cli.github.com) via `HomeBrew Brewfile`


## Chrome Extensions
* [Okta](https://chrome.google.com/webstore/detail/okta-browser-plugin/glnpjglilkicbckjpbgcfkogebgllemb?hl=en-US)
* [1password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa?hl=en-US)
* [Clockwise](https://chrome.google.com/webstore/detail/clockwise-team-time-calen/hjcneejoopafkkibfbcaeoldpjjiamog?utm_source=google&utm_medium=cpc&utm_campaign=brand_clockwise)

## Manual Setup
* [1Password CLI/App Integration](https://developer.1password.com/docs/cli/app-integration)
* [1Password for SSH & Git](https://developer.1password.com/docs/ssh)
* [1Password Github Shell Plugin](https://developer.1password.com/docs/cli/shell-plugins/github)

## Homebrew or asdf
Use Homebrew unless multiple versions or a specific version is needed.
