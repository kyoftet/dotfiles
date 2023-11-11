#!/bin/bash
cd

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc

while true; do
  read -p "Your Github Name: " input_name
  read -p "Your Github Email Address: " input_mail_address
  read -p "Correct? [y/n]: " validation
  case $validation in
    [yY]|[yY][eE][sS])
      echo "continue";
      break ;;
    [nN]|[nN][oO])
      echo "please input again";;
    *)
      echo "please input again";;
  esac
done
export GITHUB_USER_MAIL=$input_name
export GITHUB_USER_MAIL=$input_mail_address

# git
echo "[user]
	name = $GITHUB_USER_NAME
	email = $GITHUB_USER_MAIL
" >> ~/.gitconfig.localbrew inistll git
brew install git
brew install gh
gh auth login
git clone git@github.com:$GITHUB_USER_NAME/dotfiles.git

curl -fsSL https://get.jetpack.io/devbox | bash

brew install git
brew install starship
brew install neovim
brew install zellij
brew install hammerspoon
brew install lazygit

brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

cd ~/.dotfiles
core/script/symbolic.sh

PS3="Please select your OS: "
options=("mac", "wsl", "linux")
select choice in "${options[@]}"; do
  case $choice in
    "MacOS")
      mac/script/ini.sh
      ;;
    "WSL")
      wsl/script/symbolic.sh
      ;;
    "linux")
      linux/script/symbolic.sh
      ;;
    *)
      echo "only mac or wsl or linux"
      cd
      ;;
  esac
done

