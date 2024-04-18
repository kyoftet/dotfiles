#!/bin/zsh

# dotfiles
git clone https://github.com/kyoF/dotfiles.git

# rust
cd $HOME/dotfiles
./script/rust.sh

# symbolic link
cd $HOME/dotfiles
./script/ln.sh

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
" > $HOME/.gitconfig

cd $HOME
sudo pacman -S git
sudo pacman -Sy neovim
sudo pacman -S tmux
sudo pacman -S lazygit
sudo pacman -S wezterm
sudo pacman -S alacritty
sudo pacman -S docker
sudo pacman -S docker-compose

cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME
rm -rf yay

yay -S google-chrome
yay -S microsoft-edge-dev-bin

