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

for dotfile in "${(k)config[@]}"; do
  if [ -d $HOME/$dotfile ]; then
    echo "$dotfile directory found"
    echo "if press (y), this directory delete and create new $dotfile"
    read -k 1 -r "continue? (y/n): "
    echo "" 
    
    if [[ $REPLY == "y" || $REPLY == "Y" ]]; then
        continue
    elif [[ $REPLY == "n" || $REPLY == "N" ]]; then
        break
    else
        echo "you must pres y or n"
    fi
  elif [ -f $HOME/$dotfile ]; then
    echo "$dotfile file found"
    echo "if press (y), this file delete and create new $dotfile"
    read -k 1 -r "continue? (y/n): "
    echo "" 
    
    if [[ $REPLY == "y" || $REPLY == "Y" ]]; then
        continue
    elif [[ $REPLY == "n" || $REPLY == "N" ]]; then
        break
    else
        echo "you must pres y or n"
    fi
  fi
  ln -snfv ${PWD}/$key $config[$key]
done
