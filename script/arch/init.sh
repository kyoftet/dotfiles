#!/bin/bash

######################
######## init ########
######################
cd $HOME

echo "[user]
  name = kyof
  email = $1
" > $HOME/.gitconfig

mkdir -p "$HOME/.config"

git clone git@github.com:kyoF/dotfiles.git
cd $HOME/dotfiles
./script/arch/ln.sh

##############################
######## install rust ########
##############################
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

###################################
######## exec shell script ########
###################################
cd $HOME/dotfiles
./script/utils/rust.sh

###############################
######## symbolic link ########
###############################
./script/arch/ln.sh

#############################
######## reboot arch ########
#############################
sudo reboot
