# import local .zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# core
alias ls='lsd'
alias ll='lsd -al'
alias c='clear'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir'
alias t='touch'
alias rd='rmdir'
alias rr='rm -rf'
alias e='exit'
alias sshell='source ~/.zshrc'
alias dot='cd ~/dotfiles'
alias ndot='nvim ~/dotfiles'
alias lg='lazygit'
alias checkport='lsof -i -P | grep'
alias kl='kill -9'

# rust
alias cat='bat'
alias curl='xh'
alias gcat='glitchcat'
alias fd='find'
alias sabori='genact'

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
alias dcup='docker compose up -d --build'

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# tmux
alias stmux='tmux source ~/.config/tmux/tmux.conf'
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
alias to='./.config/alacritty/bin/toggle_opacity.sh'
