# How To Use (MacOS)
```
設定 > セキュリティとプライバシー > フルディスクアクセス に ターミナル に追加
```
```
xcode-select --install
git clone https://github.com/kyoF/dotfiles.git
cd dotfiles
cp .env.sample .env
-- edit .env file --
script/mac/initial.sh
```

## Manually Setting
* 設定 > セキュリティとプライバシー > フルディスクアクセス の Alacritty にチェック
* 設定 > 通知と集中モード > 通知が必要ない項目の通知をOFF
* 設定 > バッテリー > 電源アダプタ > ディスプレイをオフにする を 15分後 に設定
 
* ローカル特有の設定ができるファイル
  * .zshrc.local
  * .gitconfig.local


# How To Use on Windows(WSL)
```
bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/kyoF/dotfiles/main/script/linux/ini.sh)"
```

