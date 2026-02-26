export TERM="xterm-256color"
[[ $XDG_SESSION_DESKTOP == plasma ]] && export KWIN_TRIPLE_BUFFER=1

# Install plugins if missing
if [[ ! -d ~/.zsh ]]; then
    mkdir -p ~/.zsh
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# Plugins (autosuggestions → syntax is common order)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Just need it
autoload -Uz compinit
compinit

# ─── Git ───────────────────────────────────────────────────────────────
alias gs='git status'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gsw='git switch'
alias gp='git pull && git push'
alias gpl='git pull'
alias gf='git fetch --all --prune'
alias gundo='git reset --soft HEAD~1'
alias gst='git stash'
alias pop='git stash pop'
alias gstapp='git stash apply'

# ─── Editor & Config ───────────────────────────────────────────────────
alias vim='nvim'
alias svim='sudo nvim'
alias ez='$EDITOR ~/.zshrc'
alias sz='source ~/.zshrc'

# ─── Modern ls ─────────────────────────────────────────────────────────
alias ls='eza --icons'
alias l='lsd --date "+%d.%m.%Y %H:%M" -lah'

# eval "$(starship init zsh)"


