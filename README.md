# dotfiles
## Git Bare Repository
This repository is intended to be pulled as a bare repositiry as described by [this article.](https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d)

### Installing This Config on a New System
To install and use this repository as your MacOS configuration, run 
* `curl https://raw.githubusercontent.com/dawilliams/dotfiles/main/bin/strap.sh --silent --output /tmp/strap.sh`
* Review script variables at `# Update these before running script`
* Run the `/tmp/strap.sh` script
* Restart terminal application to get new config
* Follow the [1Password CLI/App Integration](https://developer.1password.com/docs/cli/app-integration) instructions
* Follow the [1Password for SSH & Git](https://developer.1password.com/docs/ssh) instructions
* Set `url` under `[remote "origin"]` to `ssh://git@github.com/dawilliams/dotfiles.get` in the `~/.dotfiles/config` file
* Set `url` under `[remote "origin"]` to `ssh://git@github.com/dawilliams/dotfiles.get` in the `/opt/homebrew/.git/config` file
* Follow the [1Password Github Shell Plugin](https://developer.1password.com/docs/cli/shell-plugins/github) instructions
* Follow the [1Password Homebrew Shell Plugin](https://developer.1password.com/docs/cli/shell-plugins/homebrew) instructions
* Follow the [1Password Sourcegraph Shell Plugin](https://developer.1password.com/docs/cli/shell-plugins/sourcegraph) instructions

## What's installed
* [Xcode Command Line Tools](https://www.makeuseof.com/install-xcode-command-line-tools/) via `xcode-select --install`
* [Homebrew](https://docs.brew.sh/Installation#macos-requirements) via `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
* [zsh](https://www.zsh.org/) via `HomeBrew Brewfile`
* [1password](https://1password.com) via `HomeBrew Brewfile`
* [1password-cli](https://1password.com/downloads/command-line) via `HomeBrew Brewfile`
* [git](https://git-scm.com/) via `HomeBrew Brewfile`
* [github cli](https://cli.github.com) via `HomeBrew Brewfile`
* [jq](https://stedolan.github.io/jq) via `HomeBrew Brewfile`
* [sourcegraph cli](https://docs.sourcegraph.com/cli) via `HomeBrew Brewfile`
* [asdf](https://asdf-vm.com/) via `HomeBrew Brewfile`
* [xz](https://tukaani.org/xz/) via `HomeBrew Brewfile`. Needed for python 3.10
* [direnv](https://direnv.net) via `asdf`
* [python](https://www.python.org/downloads/release/python-3100) via `asdf`
* [poetry](https://python-poetry.org) via `asdf`


## What's configured
* Homebrew zsh is made the default shell
* Terminal application is configured

## Chrome Extensions
* [Okta](https://chrome.google.com/webstore/detail/okta-browser-plugin/glnpjglilkicbckjpbgcfkogebgllemb?hl=en-US)
* [1password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa?hl=en-US)
* [Clockwise](https://chrome.google.com/webstore/detail/clockwise-team-time-calen/hjcneejoopafkkibfbcaeoldpjjiamog?utm_source=google&utm_medium=cpc&utm_campaign=brand_clockwise)
* [AWS Extend Switch Roles](https://chrome.google.com/webstore/detail/aws-extend-switch-roles/jpmkfafbacpgapdghgdpembnojdlgkdl/related?hl=en)
* [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)

## Homebrew or asdf
Use Homebrew unless multiple versions or a specific version is needed.
