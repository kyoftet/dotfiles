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
alias vshell='vi ~/.zshrc'
alias sshell='source ~/.zshrc'
alias cddot='cd ~/dotfiles'
alias lg='lazygit'

# homebrew
alias b='brew'
alias bi='brew install'

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# git alias
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gP='git pull'
alias gs='git status'
alias gb='git branch'
alias gC='git checkout'
alias gl='git log'
alias gd='git diff'
alias gf='git fetch'

# docker compose
alias dc='docker compose'
alias d-c='docker-compose'
alias dcdel='docker-compose down --rmi all --volumes --remove-orphans'

# alacritty
export PATH=$PATH:~/.config/alacritty/bin

# neovim
alias vi='nvim'

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# devbox
alias db='devbox'
alias dbs='devbox shell'

# import local .zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

