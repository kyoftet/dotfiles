#!/bin/bash
cd

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc

while true; do
  read -p "your github user name: " input_name
  read -p "your github email address: " input_mail_address

  read -p "Correct? [y/n]: " validation

  case $validation in
    [yY]|[yY][eE][sS])
      echo "Continue...";
      break ;;
    [nN]|[nN][oO])
      echo "please input again!";;
    *) 
      echo "faild."
      echo "please input again!"
  esac
done

export GITHUB_USER_NAME=$input_name
export GITHUB_USER_MAIL=$input_mail_address

# git
echo "[user]
	name = $GITHUB_USER_NAME
	email = $GITHUB_USER_MAIL
" >> ~/.gitconfig.local
brew install git
brew install gh
gh auth login
git clone -b feat-focus-on-config git@github.com:kyof/dotfiles.git

curl -fsSL https://get.jetpack.io/devbox | bash

brew install starship
brew install neovim
brew install zellij
brew install lazygit

brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

cd ~/dotfiles
script/utils/symbolic.sh "linux"
