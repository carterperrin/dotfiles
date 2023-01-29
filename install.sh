#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

DIR=$(cd "$(dirname "$0")"; pwd)
FILES="vimrc vim vimrc.bundles zshrc tmux.conf gitconfig warp/keybindings.yaml" # list of files/folders to symlink in homedir
ZSH="${DIR}/oh-my-zsh"

# Before relying on Homebrew, check that packages can be compiled
if ! type 'gcc' &> /dev/null; then
	e_error "The XCode Command Line Tools must be installed first."
	printf "  Run `sudo xcode-select --install` or download them directly\n"
	printf "  from: https://developer.apple.com/downloads\n"
	printf "  Then re-run the install script.\n"
	exit 1
fi

# Check for Homebrew
if ! type 'brew' &> /dev/null; then
	e_header "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check for git
if ! type 'git' &> /dev/null; then
	e_header "Updating Homebrew..."
	brew update
	e_header "Installing Git..."
	brew install git
	brew install gh
fi

# Check for tmux
if ! type 'tmux' &> /dev/null; then
	e_header "Updating Homebrew..."
	brew update
	e_header "Installing tmux..."
	brew install tmux
fi

# Initialize the git repository if it's missing
# if ! is_git_repo; then
# 	e_header "Initializing git repository..."
# 	git init
# 	git remote add origin https://github.com/${DOTFILES_REPO}
# 	git checkout -b main
# 	git fetch origin main
# 	# Reset the index and working tree to the fetched HEAD
# 	git reset --hard FETCH_HEAD
# fi

# Check for zsh
if [[ ! -d ${ZSH} ]]; then
	  ZSH="$ZSH" RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

########## Symlink

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# create symlinks 
for file in $FILES; do
    echo "Creating symlink to $file in home directory."
    rm -rf $HOME/.$file
    ln -s $DIR/$file $HOME/.$file
done

zsh -l
