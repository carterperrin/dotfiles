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

# Git worktree helper: gw <name> <branch>
# Creates a sibling worktree directory with a new branch
gw() {
  if [ $# -ne 2 ]; then
    echo "Usage: gw <worktree-name> <branch-name>"
    return 1
  fi
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Not in a git repo"; return 1; }
  git worktree add "$(dirname "$root")/$1" -b "$2"
}

# Git worktree delete: gwd <name>
# Removes a sibling worktree directory
gwd() {
  if [ $# -ne 1 ]; then
    echo "Usage: gwd <worktree-name>"
    return 1
  fi
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Not in a git repo"; return 1; }
  git worktree remove "$(dirname "$root")/$1"
}

# Git worktree list: gwl
gwl() {
  git worktree list
}

# Git worktree move/rename: gwm <old-name> <new-name>
gwm() {
  if [ $# -ne 2 ]; then
    echo "Usage: gwm <old-name> <new-name>"
    return 1
  fi
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Not in a git repo"; return 1; }
  local parent="$(dirname "$root")"
  git worktree move "$parent/$1" "$parent/$2"
}

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
