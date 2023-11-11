#!/bin/zsh

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

brew install --cask alacritty
brew install --cask karabiner-elements
brew install --cask clipy
brew install --cask microsoft-edge
# brew install --cask visual-studio-code
brew install --cask slack
brew install --cask docker
brew install --cask appcleaner
brew install --cask vivaldi
echo ------- Finish: application install --------

cd ~/.dotfiles
mac/script/symbolic.sh

cd ~/Downloads
git clone git@github.com:asmagill/hs._asm.spaces.git
cd hs._asm.spaces
make install-universal
cd ../
rm -rf hs._asm.spaces
echo -------- Finish: hammerspoon setting --------

cd ~/dotfiles
script/mac/macos.sh
echo -------- Finish: mac setting --------

# cd ~/dotfiles
# script/vscode.sh
# echo -------- Finish: vscode setting --------

echo -------- Finish: All --------
echo -------- execute sudo reboot --------

