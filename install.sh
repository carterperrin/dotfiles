#!/bin/bash
############################
# Sets up a fresh dev environment with neovim, tmux, and zsh
############################

set -e

DIR=$(cd "$(dirname "$0")"; pwd)
ZSH="${DIR}/oh-my-zsh"

info() { printf "\033[1;34m→ %s\033[0m\n" "$1"; }
success() { printf "\033[1;32m✓ %s\033[0m\n" "$1"; }
error() { printf "\033[1;31m✗ %s\033[0m\n" "$1"; }

# -------- Prerequisites --------

if ! type 'gcc' &> /dev/null; then
  error "XCode Command Line Tools required. Run: sudo xcode-select --install"
  exit 1
fi

# -------- Homebrew --------

if ! type 'brew' &> /dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -------- Brew packages --------

PACKAGES=(
  neovim
  tmux
  git
  gh
  ripgrep     # telescope live grep
  fd          # telescope find files
  fzf         # shell history search
  starship    # prompt
  node        # needed for some LSPs
)

info "Installing brew packages..."
for pkg in "${PACKAGES[@]}"; do
  if ! brew list "$pkg" &> /dev/null; then
    info "Installing $pkg..."
    brew install "$pkg"
  else
    success "$pkg already installed"
  fi
done

# -------- NVM --------

if [ ! -d "$HOME/.nvm" ] || [ ! -s "$HOME/.nvm/nvm.sh" ]; then
  info "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi

# -------- Oh My Zsh --------

if [[ ! -d ${ZSH} ]]; then
  info "Installing Oh My Zsh..."
  ZSH="$ZSH" RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# -------- Zsh plugins --------

ZSH_CUSTOM="${ZSH}/custom"

if [[ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]]; then
  info "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
fi

if [[ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]]; then
  info "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
fi

# -------- TPM (tmux plugin manager) --------

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  info "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# -------- Symlinks --------

info "Creating symlinks..."

# Shell & git
ln -sf "$DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DIR/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DIR/gitconfig" "$HOME/.gitconfig"

# Neovim + starship config
mkdir -p "$HOME/.config"
ln -sfn "$DIR/nvim" "$HOME/.config/nvim"
ln -sf "$DIR/starship.toml" "$HOME/.config/starship.toml"

# Clean up old vim symlinks if they exist
[ -L "$HOME/.vimrc" ] && rm "$HOME/.vimrc"
[ -L "$HOME/.vim" ] && rm "$HOME/.vim"
[ -L "$HOME/.vimrc.bundles" ] && rm "$HOME/.vimrc.bundles"

success "Symlinks created"

# -------- Neovim first-run setup --------

info "Running neovim plugin install (this may take a minute)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

success "Done! Open a new terminal to start using your setup."
success "Run 'nvim' and Mason will auto-install LSP servers on first launch."
