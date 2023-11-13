# git
while true; do
  read -p "your github user name: " input_name
  read -p "your github email address: " input_mail_address

  read -p "Correct? [y/n]: " validation

  case $validation in
    [yY]|[yY][eE][sS])
      echo "Continue...";
      break ;;
    [nN]|[nN][oO])
      echo "please input again!";;
    *)
      echo "faild."
      echo "please input again!"
  esac
done
export GITHUB_USER_NAME=$input_name
export GITHUB_USER_MAIL=$input_mail_address
echo "[user]
  name = $GITHUB_USER_NAME
  email = $GITHUB_USER_MAIL
" >> ~/.gitconfig.local
gh auth login
git clone -b feat-focus-on-config git@github.com:kyof/dotfiles.git

