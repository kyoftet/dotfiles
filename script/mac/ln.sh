#!/bin/zsh

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".hammerspoon" ]] && continue
 
  if [[ $f == ".config" ]]; then
    for config_dir in ${PWD}/"$f"/*; do
      config_dir_name=$(basename "$config_dir")
      ln -snfv "$config_dir" ~/.config/"$config_dir_name"
    done
    continue
  else
    ln -snfv ${PWD}/"$f" ~/
  fi
done

source ~/.zshrc
