alias ls='ls -FG'
alias ll='ls -alFG'
alias c='clear'

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
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gl='git log'
alias gd='git diff'

# docker compose
alias dc='docker compose'
alias d-c='docker compose'

# alacritty
export PATH=$PATH:~/.config/alacritty/bin

# neovim
alias vi='nvim'

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

