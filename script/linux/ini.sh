#!/bin/bash

chsh -s "$(which zsh)"

git clone https://github.com/kyoF/dotfiles.git

# symbolic link 
cd dotfiles
./script/linux/symbolic.sh
echo =============================================
echo ======== finish create symbolic link ========
echo =============================================

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
install_app=(
  gcc
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
echo ==================================
echo ======== finish setup git ========
echo ==================================

echo ============================
echo ======== finish all ========
echo ============================

