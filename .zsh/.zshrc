# history
export HISTFILE=${HOME}/.zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# import local .zshrc
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# env
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# js/ts
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# homebrew
export PATH="$PATH:/opt/homebrew/bin/"
eval "$(/opt/homebrew/bin/brew shellenv)"
# starship
eval "$(starship init zsh)"
# sheldon
eval "$(sheldon source)"
# mise
eval "$(mise activate zsh)"

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
alias sshell="source $HOME/.zshenv"
alias dot="cd $HOME/dotfiles"
alias checkport='lsof -i -P | grep'
alias kl='kill -9'
alias cat='bat'
alias curl='xh'
alias gcat='glitchcat'
alias sabori='genact'
alias tock='tock -scm -C 4'

# git alias
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
alias lg='lazygit'
alias gopen='git open'

# docker alias
alias dc='docker compose'
alias dcp='docker compose --profile'
alias dcdel='docker compose down --rmi all --volumes --remove-orphans'
alias dcup='docker compose up -d --build'
alias dcpdev='docker compose --profile dev'

# tmux
alias stmux="tmux source $HOME/.config/tmux/tmux.conf"
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
alias to="$HOME/.config/alacritty/bin/toggle_opacity.sh"
