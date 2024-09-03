#!/usr/bin/env bash

if ! command -v brew &> /dev/null; then
    echo "Homebrew isn't installed. This script uses it to install programs. Exiting..."
    exit 1
fi

# MacGyver-approved.
DOTFILES_ABS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install the following programs, or update them if they're already installed.
brew install --cask wezterm
brew install neovim tmux ripgrep fd

# Install a copy of the wezterm terminfo file. Neovim and tmux, at least, both
# use this to render undercurls.
#
# https://wezfurlong.org/wezterm/faq.html#how-do-i-enable-undercurl-curly-underlines
rm -rf $HOME/.terminfo
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile

# Copy config files in their expected locations.

ln -sf $DOTFILES_ABS_PATH/zsh/zshrc $HOME/.zshrc

ln -sf $DOTFILES_ABS_PATH/wezterm/wezterm.lua $HOME/.wezterm.lua

ln -sf $DOTFILES_ABS_PATH/tmux/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/nvim
ln -s $DOTFILES_ABS_PATH/nvim $HOME/.config/nvim
