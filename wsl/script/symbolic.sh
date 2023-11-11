#!/bin/zsh

for f in wsl/.??*; do
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc 

