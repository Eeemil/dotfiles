#!/bin/bash
############################
# deploy.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # dotfiles directory: same directory as calling script
olddotfiles="${HOME}/backup-dotfiles"         # old dotfiles backup directory
files=".emacs .emacs.d .config/terminator/config .gitconfig .zshrc .gitignore-global .profile .aspell.en.pws .tmux.conf"  # list of configuration files to deploy
START="$(date '+%Y-%m-%d_%H:%M:%S')"
##########

# create dotfiles_old in homedir
echo "Creating $olddotfiles for backup of any existing dotfiles in ~"
echo "mkdir -p $olddotfiles"
mkdir -p "${olddotfiles}"

# change to the dotfiles directory
cd "${dotfiles}" || exit 1

# Install any submodule
git submodule init
git submodule update

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    # Ensure that the directory for the configuration file exists...
    # May not be the case for e.g. ~/.config/terminator/config
    mkdir -p "$(dirname "${HOME}/${file}")"

    if [ -f "${HOME}/${file}" ]; then
	echo "Moving existing dotfile from $HOME/$file to $olddotfiles"
	mv "$HOME/$file" "$olddotfiles/$START-$file"
    fi
    echo "Creating symlink to $file in home directory."
    ln -sfn "$dotfiles/$file" "$HOME/$file"
done

# Install custom binaries
mkdir -p ~/bin
ln -s ../gnome-settings/load-settings.sh ~/bin/load-gnome-settings
