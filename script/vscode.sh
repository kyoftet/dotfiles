#!/bin/zsh
MYVSCODE=~/dotfiles/vscode
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

if [[ -e "$VSCODE_SETTING_DIR/settings.json" ]]; then
  rm "$VSCODE_SETTING_DIR/settings.json"
fi
ln -s "$MYVSCODE/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

if [[ -e "$VSCODE_SETTING_DIR/keybindings.json" ]]; then
  rm "$VSCODE_SETTING_DIR/keybindings.json"
fi
ln -s "$MYVSCODE/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

cat $MYVSCODE/extensions | while read line
do
  code --install-extension $line
done

code --list-extensions > extensions
