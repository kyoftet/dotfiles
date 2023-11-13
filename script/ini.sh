#!/bin/bash
cd

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
if [ "$(uname)" == "Darwin" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential
  brew install gcc
fi

brew install gh

gh auth login

git clone git@github.com:kyof/dotfiles.git
cd dotfiles

if [ "$(uname)" == "Darwin" ]; then
  script/mac/ini.sh
else
  script/linux/ini.sh
fi

