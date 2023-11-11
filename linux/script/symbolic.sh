#!/bin/zsh

for f in linux/.??*; do
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc 

