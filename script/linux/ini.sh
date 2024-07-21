#!/bin/bash

echo "[user]
  name = $1
  email = $2
" > $HOME/.gitconfig

# dotfiles
git clone git@github.com:kyoF/dotfiles.git

# symbolic link 
cd $HOME/dotfiles
for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".hammerspoon" ]] && continue
 
  if [[ $f == ".config" ]]; then
    for config_dir in ${PWD}/"$f"/*; do
      config_dir_name=$(basename "$config_dir")
      [[ "$confid_dir" == "alacritty" ]] && continue
      [[ "$confid_dir" == "karabiner" ]] && continue
      [[ "$confid_dir" == "wezterm" ]] && continue
      ln -snfv "$config_dir" ~/.config/"$config_dir_name"
    done
    continue
  else
    ln -snfv ${PWD}/"$f" ~/
  fi
done

# rust
./script/rust.sh
