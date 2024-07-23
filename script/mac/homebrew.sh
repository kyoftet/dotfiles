#!/bin/zsh

# symbolic link 
mkdir -p "$HOME/.config"
cd $HOME/dotfiles
./script/mac/ln.sh

# homebrew
/bin/bash -c "$(sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source $HOME/.zshenv
brew tap Homebrew/bundle
brew bundle --file "./script/mac/Brewfile"

# line
mas install 539883307

# macos
cd $HOME/dotfiles
./script/mac/macos.sh

# rust
./script/rust.sh
