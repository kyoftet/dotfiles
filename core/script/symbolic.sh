#!/bin/zsh

for f in core/.??*; do
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc 

