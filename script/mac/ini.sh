#!/bin/bash

# xcode
xcode-select --install
echo ======== finish install xcode-select ========

# dotfiles
git clone https://github.com/kyoF/dotfiles.git

# symbolic link 
cd dotfiles
./script/mac/ln.sh
echo ======== finish create symbolic link ========

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
install_cli_app=(
  git
  neovim
  starship
  tmux
  lazygit
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  ripgrep
)
for app in ${install_cli_app[@]};
do
  brew install $app
done
install_gui_app=(
  wezterm
  clipy
  microsoft-edge
  google-chrome
  visual-studio-code
  slack
  docker
  appcleaner
)
for app in ${install_gui_app[@]};
do
  brew install --cask $app
done
echo ======== finish setup brew ========

# devbox
# curl -fsSL https://get.jetpack.io/devbox | bash
# echo ======== finish install devbox ========

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

# macos
cd $HOME/dotfiles
./script/mac/macos.sh
echo ======== Finish setup macos ========

echo ======== finish all ========
