#!/bin/bash
cd

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
install_app=(
  gcc
  git
  gh
  starship
  neovim
  zellij
  lazygit
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)
for app in ${install_app[@]};
do
  brew install $app
done
echo ======== finish brew install ========

# devbox
curl -fsSL https://get.jetpack.io/devbox | bash
echo ======== finish install devbox ========

# git
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
echo "[user]
  name = $GITHUB_USER_NAME
  email = $GITHUB_USER_MAIL
" >> ~/.gitconfig.local
gh auth login
git clone -b feat-focus-on-config git@github.com:kyof/dotfiles.git
echo ======== finish setup git ========

# symbolic link 
cd ~/dotfiles
script/utils/symbolic.sh
echo ======== finish setup git ========

echo ============================
echo ======== finish all ========
echo ============================

