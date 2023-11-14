#!/bin/zsh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
install_cli_app=(
  zsh
  git
  starship
  neovim
  zellij
  lazygit
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
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
  hammerspoon
)
for app in ${install_gui_app[@]};
do
  brew install --cask $app
done
echo =====================================
echo ======== finish brew install ========
echo =====================================

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
      echo "faild."
      echo "please input again!"
  esac
done
echo "[user]
  name = $name
  email = $mail
" >> ~/.gitconfig.local
echo ==================================
echo ======== finish setup git ========
echo ==================================

# hammerspoon
cd ~/Downloads
git clone git@github.com:asmagill/hs._asm.spaces.git
cd hs._asm.spaces
make install-universal
cd ../
rm -rf hs._asm.spaces
echo ==========================================
echo ======== Finish setup hammerspoon ========
echo ==========================================

cd ~/dotfiles
# vscode
./vscode/vscode.sh
echo =====================================
echo ======== finish setup vscode ========
echo =====================================

# symbolic link 
./script/mac/symbolic.sh
echo =======================================
echo ======== finish setup dotfiles ========
echo =======================================

# macos
./script/mac/macos.sh
echo ====================================
echo ======== Finish setup macos ========
echo ====================================

echo ============================
echo ======== finish all ========
echo ============================

