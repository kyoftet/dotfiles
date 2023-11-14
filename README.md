# How To Use
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/kyoF/dotfiles/main/script/ini.sh)"
```

※ MacOSは、下記を実行してください
```
設定 > セキュリティとプライバシー > フルディスクアクセス に ターミナル に追加
```

# Manually Setting
## MacOS
* 設定 > セキュリティとプライバシー > フルディスクアクセス の Alacritty にチェック
* 設定 > 通知と集中モード > 通知が必要ない項目の通知をOFF
* 設定 > バッテリー > 電源アダプタ > ディスプレイをオフにする を 15分後 に設定
## Windows
* 色々
### WSL
```.zshrc.local
# `^M(改行)`は`Ctrl+v`->`Ctrl+m`で入力する
export WINDOWS_USERNAME=$(powershell.exe '$env:USERNAME' | sed -e 's/
//g')
export WINDOWS_HOME=/mnt/c/Users/$WINDOWS_USERNAME
export WINDOWS_ALACRITTY_PATH=$WINDOWS_HOME/AppData/Roaming/alacritty

alias to='~/.config/alacritty/windows/toggle_opacity.sh'
```
```terminal
source $HOME/.zshrc
mkdir -p $WINDOWS_ALACRITTY_PATH
mv $HOME/dotfiles/.config/alacritty/windows/alacritty.yml $WINDOWS_ALACRITTY_PATH/alacritty.yml
ln -snfv $WINDOWS_ALACRITTY_PATH/alacritty.yml $HOME/dotfiles/.config/alacritty/windows/alacritty.yml
```
 
# Remarks
* ローカルの設定ができるファイル
  * .zshrc.local
  * .gitconfig.local

