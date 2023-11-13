#!/bin/zsh

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".zshrc.linux" ]] && continue
done

source ~/.zshrc

