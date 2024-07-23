#!/bin/zsh

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".hammerspoon" ]] && continue
 
  if [[ $f == ".config" ]]; then
    for config_dir in ${PWD}/"$f"/*; do
      config_dir_name=$(basename "$config_dir")
      [[ config_dir_name = "karabiner" ]] && continue
      ln -snfv "$config_dir" $HOME/.config/"$config_dir_name"
    done
    continue
  else
    ln -snfv ${PWD}/"$f" $HOME/
  fi
done

source $HOME/.zshenv
