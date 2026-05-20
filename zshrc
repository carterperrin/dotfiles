export ZSH="$HOME/.dotfiles/oh-my-zsh"

mkdir -p "$HOME/.nvm"

ZSH_THEME=""
ZSH_DISABLE_COMPFIX=true

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Aliases
alias k="kubectl"
alias t="terraform"
alias tw="terraform workspace"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias login-aws="aws sso login"
alias vim="nvim"
alias vi="nvim"

# fzf keybindings (Ctrl-R history, Ctrl-T file picker)
source <(fzf --zsh)

# Starship prompt
eval "$(starship init zsh)"

# Auto-start tmux (skip in IDE terminals and non-interactive shells)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -z "$VSCODE_TERMINAL" ] && [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    exec tmux
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
