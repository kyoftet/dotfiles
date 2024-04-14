#!/bin/zsh

cd $HOME/dotfiles

os=$(uname)
declare -A config

if [[ "$os" == "Darwin" ]]; then
  config_file="./script/mac/config.txt"
else
  config_file="./script/linux/config.txt"
fi

while read -r line; do
  [[ $line =~ ^#.* ]] && continue
    
  if [[ $line =~ ^([^=]+)=(.*)$ ]]; then
    key=${match[1]}
    value=${match[2]}
    config[$key]=$value
  fi
done < "$config_file"

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".hammerspoon" ]] && continue
  if [[ $f == ".config" ]]; then
    ln -snfv ${PWD}/"$f"/nvim ~/.config/
    ln -snfv ${PWD}/"$f"/starship ~/.config/
    ln -snfv ${PWD}/"$f"/alacritty ~/.config/
    ln -snfv ${PWD}/"$f"/tmux ~/.config/
    ln -snfv ${PWD}/"$f"/wezterm ~/.config/
    ln -snfv ${PWD}/"$f"/zellij ~/.config/
    ln -snfv ${PWD}/"$f"/sheldon ~/.config/
    ln -snfv ${PWD}/"$f"/mise ~/.config/
    ln -snfv ${PWD}/"$f"/git ~/.config/
    continue
  fi
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc
