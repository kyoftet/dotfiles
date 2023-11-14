#!/bin/bash

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  unlink $HOME/"$f"
done

