#!/bin/zsh

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".zshrc.linux" ]] && continue
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc

