source ./.env

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
curl -fsSL https://get.jetpack.io/devbox | bash

brew install git
brew install starship
brew install neovim
brew install zellij
brew install hammerspoon

brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install --cask alacritty
brew install --cask karabiner-elements
brew install --cask arc
brew install --cask clipy
brew install --cask google-chrome
brew install --cask microsoft-edge
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask docker
brew install --cask appcleaner
echo ------- Finish: application install --------

script/symbolic.sh
echo "[user]
	name = $GITHUB_USER_NAME
	email = $GITHUB_USER_MAIL
" >> ~/.gitconfig.local
git remote set-url origin git@github.com:"$GITHUB_USER_NAME"/dotfiles.git
ssh-keygen -t ed25519 -C "$GITHUB_USER_MAIL"
cat ~/.ssh/id_ed25519.pub
echo -------- Finish: git setting --------

cd ~/Downloads
git clone git@github.com:asmagill/hs._asm.spaces.git
cd hs._asm.spaces
make install
cd ../
rm -rf hs._asm.spaces
echo -------- Finish: hammerspoon setting --------

cd ~/dotfiles
script/macos.sh
echo -------- Finish: mac setting --------

echo -------- Finish: All --------
echo -------- execute sudo reboot --------

