#!/bin/zsh

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".env" ]] && continue
  [[ $f == ".env.sample" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc 

