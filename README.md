# This is my dotfiles repo

It uses [chezmoi](https://www.chezmoi.io/) to manage files/templates and scripts to execute on the correct order. 

Read [this guide](https://www.moncefbelyamani.com/automating-the-setup-of-a-new-mac-with-all-your-apps-preferences-and-development-tools/) to understand how it works.

## Setup in a new computer

To apply dotfiles in a new macOS computer, that's the steps: 

### Install and Configure Dependencies

1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install chezmoi, git and github client

```
brew install git
brew install gh
brew install chezmoi
```

3. Authenticate to github to your account

```
gh auth login --scopes repo
```
> Add your ssh key to profile so you can clone repositories

### Initialize Chezmoi using this repo

```
chezmoi init git@github.com:msantino/dotfiles.git
```

### Apply changes

```
chezmoi update
```

This command will apply changes, configurations and installations required to setup. 

> The Homebrew step use mas to install apps from App Store. To this step succeed, your Apple ID account must be configured in the new mac. If not, you can cancel every app install and the script will fail, but all other installs will be fine. 

