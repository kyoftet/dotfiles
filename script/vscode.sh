#!/bin/zsh
MYVSCODE=~/dotfiles/vscode
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

if [[ -L "$VSCODE_SETTING_DIR/settings.json" ]]; then
  rm "$VSCODE_SETTING_DIR/settings.json"
fi
ln -fsvn "$MYVSCODE/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

if [[ -L "$VSCODE_SETTING_DIR/keybindings.json" ]]; then
  rm "$VSCODE_SETTING_DIR/keybindings.json"
fi
ln -fsvn "$MYVSCODE/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

cat $MYVSCODE/extensions | while read line
do
  code --install-extension $line
done

code --list-extensions > extensions
