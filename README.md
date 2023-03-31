# mycfg
## Git Bare Repository
This repository is intended to be pulled as a bare repositiry as described by [this article.](https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d)

### Installing This Config on a New System
To install and use this repository as your MacOS configuration, run 
* `xcode-select --install` to install Xcode command line tools
* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"` to install Homebrew
* `curl https://raw.githubusercontent.com/dawilliams/mycfg/main/scripts/config-init | bash` to download and run the [config-init](scripts/config-init) file stored in this repository.
* `brew bundle` to install applications and utilities managed by Homebrew

## What's installed
* [Xcode Command Line Tools](https://www.makeuseof.com/install-xcode-command-line-tools/) via `xcode-select --install`
* [Homebrew](https://docs.brew.sh/Installation#macos-requirements) via `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
* [asdf](https://asdf-vm) via `HomeBrew Brewfile`
