#!/usr/bin/env bash

if ! command -v brew &> /dev/null; then
    echo "Homebrew isn't installed. This script uses it to install programs. Exiting..."
    exit 1
fi

# MacGyver-approved.
DOTFILES_ABS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install the following programs, or update them if they're already installed.
brew install --cask ghostty
brew install neovim tmux ripgrep fd

# Copy config files in their expected locations.

ln -sf $DOTFILES_ABS_PATH/zsh/zshrc $HOME/.zshrc

mkdir -p $HOME/.config/ghostty
ln -sf $DOTFILES_ABS_PATH/ghostty/config $HOME/.config/ghostty/config

ln -sf $DOTFILES_ABS_PATH/tmux/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/nvim
ln -s $DOTFILES_ABS_PATH/nvim $HOME/.config/nvim

mkdir -p $HOME/.config/jj
ln -sf $DOTFILES_ABS_PATH/jj/config.toml $HOME/.config/jj/config.toml
