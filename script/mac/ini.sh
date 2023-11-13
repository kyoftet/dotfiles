#!/bin/zsh
cd

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
install_cli_app=(
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
  brew install hammerspoon
)
for app in ${install_cli_app[@]};
do
  brew install $app
done
brew tap homebrew/cask-fonts
install_gui_app=(
  font-hack-nerd-font
  alacritty
  clipy
  microsoft-edge
  google-chrome
  visual-studio-code
  slack
  docker
  appcleaner
  vivaldi
)
for app in ${install_gui_app[@]};
do
  brew install --cask $app
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

# hammerspoon
cd ~/Downloads
git clone git@github.com:asmagill/hs._asm.spaces.git
cd hs._asm.spaces
make install-universal
cd ../
rm -rf hs._asm.spaces
echo ======== Finish setup hammerspoon ========

# vscode
cd ~/dotfiles
script/vscode.sh
echo ======== finish setup vscode ========

# symbolic link 
cd ~/dotfiles
script/utils/symbolic.sh
echo ======== finish setup dotfiles ========

# macos
cd ~/dotfiles
script/mac/macos.sh
echo ======== Finish setup macos ========

echo ============================
echo ======== finish all ========
echo ============================

