#!/bin/bash
cd
source ./.env

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

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
      echo "finish!!!"
      ;;
    *)
      echo "only mac or wsl or linux"
      cd
      ;;
  esac
done

