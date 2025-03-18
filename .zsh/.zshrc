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

# rust
alias cat='bat'
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

# docker alias
alias dc='docker compose'
alias dcup='docker compose up -d --build'
alias dcdel='docker compose down --rmi all --volumes --remove-orphans'

export EDITOR='nvim'
