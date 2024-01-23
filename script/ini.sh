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
    echo "Error: Neither yum nor apt found."
    echo "Unable to install zsh."
  fi
fi
chsh -s "$(which zsh)"
echo ======== finish setup zsh ========

# xcode
if [ "$(uname)" == "Darwin" ]; then
  xcode-select --install
  echo ======== finish install xcode-select ========
fi

# dotfiles
git clone https://github.com/kyoF/dotfiles.git

# symbolic link 
cd dotfiles
./script/ln.sh
echo ======== finish create symbolic link ========

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
install_cli_app=(
  git
  neovim
  starship
  tmux
  lazygit
  devbox
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  ripgrep
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
echo ======== finish setup brew ========

# devbox
curl -fsSL https://get.jetpack.io/devbox | bash
echo ======== finish install devbox ========

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
echo ======== finish setup git ========

if [ "$(uname)" == "Darwin" ]; then
  # macos
  cd $HOME/dotfiles
  ./script/macos.sh
  echo ======== Finish setup macos ========
fi

echo ======== finish all ========

