# import local .zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if [ $SHLVL = 1 ]; then
  tmux
fi

if [ "$(uname)" != "Darwin" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# core
alias ls='ls -FG'
alias ll='ls -alFG'
alias c='clear'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir'
alias t='touch'
alias rd='rmdir'
alias rr='rm -rf'
alias e='exit'
alias vshell='vim ~/.zshrc'
alias sshell='source ~/.zshrc'
alias cddot='cd ~/dotfiles'
alias lg='lazygit'
alias checkport='lsof -i -P | grep'
alias kl='kill -9'

# git
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
setopt complete_in_word
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
# alias
alias ga='git add'
alias gc='git commit -m'
alias gP='git push'
alias gp='git pull'
alias gs='git status'
alias gb='git branch'
alias gC='git checkout'
alias gl='git log'
alias gd='git diff'
alias gf='git fetch'

# docker compose
alias dc='docker compose'
alias dcp='docker compose --profile'
alias dcdel='docker compose down --rmi all --volumes --remove-orphans'

# vim
alias vi='vim'
alias vneovim='nvim ~/.config/nvim'

# starship
eval "$(starship init zsh)"
alias vstarship='vim ~/.config/starship.toml'

# devbox
alias db='devbox'
alias dbs='devbox shell'

# tmux
alias vtmux='vim ~/.tmux.conf'
alias stmux='tmux source ~/.tmux.conf'
function tmuxPopup() {
  width='80%'
  height='80%'
  session=$(tmux display-message -p -F "#{session_name}")
  if [[ $session == *'popup'* ]]; then
    tmux detach-client
  else
    tmux popup -d "#{pane_current_path}" -xC -yC -w $width -h $height -E "tmux attach -t popup || tmux new -s popup"
  fi
}

# alacritty
if [ "$(uname)" = "Darwin" ]; then
  export ALACRITTY_PATH=$HOME/.config
else
  export WINDOWS_USERNAME=$(powershell.exe '$env:USERNAME' | sed -e 's///g')
  export ALACRITTY_PATH=/mnt/c/Users/$WINDOWS_USERNAME/AppData/Roaming/alacritty
fi
alias valacritty='vim $ALACRITTY_PATH/alacritty.yml'
alias to='~/dotfiles/script/to.sh'
function toggleOpacity() {
	[[ ! -f $ALACRITTY_PATH/alacritty.yml ]] && \
		echo "alacritty.yml does not exist" && return

	opacity=$(awk '$1 == "opacity:" {print $2; exit}' \
		$ALACRITTY_PATH/alacritty.yml)

	case $opacity in
		1)
			toggle_opacity=0.55
			;;
		*)
			toggle_opacity=1
			;;
	esac

	sed -i "" "s/opacity: $opacity/opacity: $toggle_opacity/g" \
		$ALACRITTY_PATH/alacritty.yml
}

