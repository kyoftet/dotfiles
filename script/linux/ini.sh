#!/bin/bash
cd

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
install_app=(
  gcc
  zsh
  git
  starship
  neovim
  zellij
  lazygit
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  gh
)
for app in ${install_app[@]};
do
  brew install $app
done
echo ======== finish brew install ========

# zsh
sudo chsh -s "$(which zsh)"
# sleep 10
echo ======== finish setup zsh ========

# devbox
curl -fsSL https://get.jetpack.io/devbox | bash
echo ======== finish install devbox ========

# git
echo "[user]
  name = $1
  email = $2
" >> ~/.gitconfig.local
gh auth login
git clone git@github.com:kyoF/dotfiles.git
echo ======== finish setup git ========

# symbolic link 
cd ~/dotfiles
./script/linux/symbolic.sh
echo ======== finish setup git ========

echo ============================
echo ======== finish all ========
echo ============================

