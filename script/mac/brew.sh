#!/bin/zsh

packages=(
  git
  lazygit
  neovim
  cmake
  mas
  gcc
)
for package in "${packages[@]}"; do
  brew install "$package"
done

casks=(
  google-chrome
  microsoft-edge
  slack
  zoom
  discord
  docker
  visual-studio-code
  postman
  wezterm
  clipy
  karabiner-elements
  scroll-reverser
  appcleaner
  kindle
)
for cask in "${casks[@]}"; do
  brew install --cask "$cask"
done
mas install 539883307 # line
