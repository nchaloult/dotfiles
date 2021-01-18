#!/bin/sh

# Create directories that neovim looks in for configs, and create symlinks for
# all .vim files.

ddir=$HOME/dotfiles

mkdir -p $HOME/.config/nvim
ln -s $ddir/nvim/init.vim $HOME/.config/nvim/init.vim

mkdir -p $HOME/.config/nvim/modules
for file in nvim/modules/*.vim; do
    ln -s $ddir/$file $HOME/.config/$file
done

# Install vim-plug and the plugins specified in neovim config files.

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c 'PlugInstall' -c 'qa'
