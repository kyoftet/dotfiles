# import local .zshrc
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# env
export EDITOR='nvim'
export XDG_CONFIG_HOME=$HOME/.config
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

# path
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin/"

# zsh
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# eval
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(sheldon source)"
eval "$(mise activate zsh)"

# alias
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
alias sshell="source $HOME/.zshrc"
alias dot="cd $HOME/dotfiles"
alias checkport='lsof -i -P | grep'
alias kl='kill -9'
alias cat='bat'
alias tock='tock -scm -C 4'
## git
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
## docker
alias dc='docker compose'
alias dcup='docker compose up -d --build'
alias dcdel='docker compose down --rmi all --volumes --remove-orphans'
