#!/bin/bash

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  if [[ $f == ".config" ]]; then
    ln -snfv ${PWD}/"$f"/nvim ~/.config/
  else
    ln -snfv ${PWD}/"$f" ~/
  fi
done

source ~/.zshrc
