#!/bin/bash

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
install_app=(
  gcc
  zsh
  git
  neovim
  starship
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
echo ===================================
echo ======== finish setup brew ========
echo ===================================

# zsh
sudo chsh $USER -s "$(which zsh)"

# devbox
curl -fsSL https://get.jetpack.io/devbox | bash
echo =======================================
echo ======== finish install devbox ========
echo =======================================

# git
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
cd $HOME
gh auth login
git clone git@github.com/kyoF/dotfiles.git
echo ==================================
echo ======== finish setup git ========
echo ==================================

# symbolic link 
cd dotfiles
pwd
./script/linux/symbolic.sh
echo =============================================
echo ======== finish create symbolic link ========
echo =============================================

echo ============================
echo ======== finish all ========
echo ============================

