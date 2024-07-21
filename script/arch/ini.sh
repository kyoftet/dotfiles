#!/bin/bash

echo "[user]
  name = $1
  email = $2
" > $HOME/.gitconfig

# dotfiles
git clone git@github.com:kyoF/dotfiles.git

# symbolic link 
cd $HOME/dotfiles
./script/mac/ln.sh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap Homebrew/bundle
brew bundle --file "./script/mac/Brewfile"

# line
mas install 539883307

# macos
cd $HOME/dotfiles
./script/mac/macos.sh

# rust
./script/rust.sh
