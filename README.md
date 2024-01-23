# How To Use
```
-------------------- MacOSの場合、下記を実行してください --------------------
設定 > セキュリティとプライバシー > フルディスクアクセス に ターミナル に追加
-----------------------------------------------------------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/kyoF/dotfiles/main/script/ini.sh)"
```

※ Mac は、下記を実行してから上記のコマンドを実行してください
```
設定 > セキュリティとプライバシー > フルディスクアクセス に ターミナル を追加
```

# Manually Setting
## Mac
* 設定 > セキュリティとプライバシー > フルディスクアクセス の Alacritty にチェック
* 設定 > 通知と集中モード > 通知が必要ない項目の通知をOFF
* 設定 > バッテリー > 電源アダプタ > ディスプレイをオフにする を 15分後 に設定
## Windows
* Alacrittyのインストール
### WSL
```terminal
source $HOME/.zshrc
mkdir -p $ALACRITTY_PATH
cp $HOME/dotfiles/.config/alacritty.win.yml $ALACRITTY_PATH/alacritty.yml
```
 
# Remarks
* ローカルの設定ができるファイル
  * .zshrc.local
  * .gitconfig.local
