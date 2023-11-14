#!/bin/bash

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  [[ $f == ".zshrc.mac" ]] && continue
  [[ $f == ".hammerspoon" ]] && continue
done

source ~/.zshrc

