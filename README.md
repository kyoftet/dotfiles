# How To Use For Mac

-------------------- For MacOS, please run the following --------------------
System Preferences > Security & Privacy > Full Disk Access and add Terminal
-----------------------------------------------------------------------------

```
ssh-keygen -t ed25519 -C "your mail address"
xcode-select --install
```

```
dot
./script/mac/brew.sh
./script/utils/rust.sh
```

## Manually Setting
* System Preferences > Security & Privacy > Full Disk Access and check Alacritty and WezTerm
* System Preferences > Notifications & Focus > Turn OFF notifications for items that do not need notifications
* System Preferences > Battery > Power Adapter > Set "Turn display off after" to 15 minutes

# Remarks
* Files for local settings
    * .zshrc.local
