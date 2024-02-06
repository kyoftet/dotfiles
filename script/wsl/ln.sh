#!/bin/bash

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  if [[ $f == ".wezterm.lua" ]]; then
    cp -f .wezterm.lua /mnt/c/Users/$(powershell.exe '$env:USERNAME' | sed -e 's///g')/.wezterm.lua
  fi
  if [[ $f == ".config" ]]; then
    ln -snfv ${PWD}/"$f"/nvim ~/.config/
  else
    ln -snfv ${PWD}/"$f" ~/
  fi
done

source ~/.zshrc
