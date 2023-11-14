#!/bin/bash

# zsh
if [ "$(uname)" != "Darwin" ]; then
  if command -v yum &> /dev/null; then
    echo "I didn't think you were a red hot type..."
    echo "Sorry..."
  elif command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install zsh
  else
    echo "Error: Neither yum nor apt foun."
    echo "Unable to install zsh."
  fi
fi
chsh -s "$(which zsh)"
echo ==================================
echo ======== finish setup zsh ========
echo ==================================

# xcode
if [ "$(uname)" == "Darwin" ]; then
  xcode-select --install
  echo =============================================
  echo ======== finish install xcode-select ========
  echo =============================================
fi

# dotfiles
git clone https://github.com/kyoF/dotfiles.git
git remote set-url origin git@github.com:kyoF/dotfiles.git

# symbolic link 
cd dotfiles
if [ "$(uname)" == "Darwin" ]; then
  ./script/ln_mac.sh
else
  ./script/ln_linux.sh
fi
echo =============================================
echo ======== finish create symbolic link ========
echo =============================================

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
install_cli_app=(
  git
  neovim
  starship
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
if [ "$(uname)" == "Darwin" ]; then
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
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential
  brew install gcc
fi
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
gh auth login
echo ==================================
echo ======== finish setup git ========
echo ==================================

if [ "$(uname)" == "Darwin" ]; then
  # hammerspoon
  cd $HOME/Downloads
  git clone git@github.com:asmagill/hs._asm.spaces.git
  cd hs._asm.spaces
  make install-universal
  cd ..
  rm -rf hs._asm.spaces
  echo ==========================================
  echo ======== Finish setup hammerspoon ========
  echo ==========================================
  
  cd $HOME/dotfiles
  
  # vscode
  ./vscode/vscode.sh
  echo =====================================
  echo ======== finish setup vscode ========
  echo =====================================
  
  # macos
  ./script/mac/macos.sh
  echo ====================================
  echo ======== Finish setup macos ========
  echo ====================================
fi

echo ==========================================
echo ========        finish all        ========
echo ==========================================

echo ==========================================
echo ======== reboot shell on 5 second ========
echo ==========================================
sleep 5
exit
