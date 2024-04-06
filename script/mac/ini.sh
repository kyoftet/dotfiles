#!/bin/bash

# xcode
xcode-select --install

# dotfiles
git clone https://github.com/kyoF/dotfiles.git

# symbolic link 
cd $HOME/dotfiles
./script/ln.sh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap Homebrew/bundle
brew bundle --file "./script/mac/Brewfile"

# git
git remote set-url origin git@github.com:kyoF/dotfiles.git
while true; do
  read -p "your github user name: " name
  read -p "your github email address: " mail

  read -p "Correct? [y/n]: " validation

  case $validation in
    [yY]|[yY][eE][sS])
      echo "Continue...";
      break ;;
    [nN]|[nN][oO])
      echo "please input again!";;
    *)
      echo "faild"
      echo "please input again!"
  esac
done
echo "[user]
  name = $name
  email = $mail
" > ~/.gitconfig.local

# macos
cd $HOME/dotfiles
./script/mac/macos.sh

# rust
./script/rust.sh
