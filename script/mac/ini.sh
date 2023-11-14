#!/bin/bash
cd

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# homebrew
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
echo "[user]
  name = $1
  email = $2
" >> ~/.gitconfig
echo "[user]
  name = $1
  email = $2
" >> ~/.gitconfig.local
ssh-keygen -t ed25519 -C "kyof-dotfiles"
git clone git@github.com:kyoF/dotfiles.git
echo ======== finish setup git ========

# vscode
cd ~/dotfiles
./vscode/vscode.sh
echo ======== finish setup vscode ========

# symbolic link 
cd ~/dotfiles
./script/mac/symbolic.sh
echo ======== finish setup dotfiles ========

# macos
cd ~/dotfiles
script/mac/macos.sh
echo ======== Finish setup macos ========

# hammerspoon
cd ~/Downloads
git clone git@github.com:asmagill/hs._asm.spaces.git
cd hs._asm.spaces
make install-universal
cd ../
rm -rf hs._asm.spaces
echo ======== Finish setup hammerspoon ========

echo ============================
echo ======== finish all ========
echo ============================

