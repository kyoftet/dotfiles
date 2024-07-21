# How To Use For Mac

-------------------- For MacOS, please run the following --------------------
System Preferences > Security & Privacy > Full Disk Access and add Terminal
$ ssh-keygen -t ed25519 -C "your mail address"
-----------------------------------------------------------------------------

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/kyoF/dotfiles/main/script/mac/ini.sh)" "" githubusername githubmailaddress
```

# Manually Setting
## Mac
* System Preferences > Security & Privacy > Full Disk Access and check Alacritty and WezTerm
* System Preferences > Notifications & Focus > Turn OFF notifications for items that do not need notifications
* System Preferences > Battery > Power Adapter > Set "Turn display off after" to 15 minutes

# Remarks
* Files for local settings
    * .zshrc.local
