#!/bin/bash

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".zshrc.mac" ]] && continue
  [[ $f == ".hammerspoon" ]] && continue
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc

