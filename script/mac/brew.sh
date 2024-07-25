#!/bin/zsh

packages=(
  git
  lazygit
  neovim
  tmux
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
  arc
  slack
  zoom
  discord
  docker
  visual-studio-code
  postman
  wezterm
  alacritty
  cool-retro-term
  clipy
  karabiner-elements
  hammerspoon
  scroll-reverser
  appcleaner
)
for cask in "${casks[@]}"; do
  brew install --cask "$cask"
done
mas install 539883307 # line
