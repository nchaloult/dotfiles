#!/bin/bash

# Wires up all dotfiles by creating symlinks from the home dir (or wherever
# appropriate) to the dotfiles in ~/dotfiles

# Variables
ddir=$HOME/dotfiles
home_dir_dotfiles="oh-my-zsh zshrc"

# ========================================

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Then install packages
brew cask install iterm2
brew install zsh
brew install neovim

# Now grab oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Wiring up dotfiles that live in home dir
for file in $home_dir_dotfiles; do
    ln -s $ddir/$file $HOME/.$file
done

# Wiring up neovim config to default dir: ~/.config/nvim
mkdir -p $HOME/.config/nvim
ln -s $ddir/init.vim $HOME/.config/nvim/init.vim

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Now install plugins specified in init.vim with vim-plug
nvim -c 'PlugInstall' -c 'qa'

# Wire up iterm2 preferences
# http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
